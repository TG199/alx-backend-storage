DELIMITER //

-- Procedure: ComputeAverageWeightedScoreForUsers
-- Description: This procedure computes and stores the average weighted score for all students.
-- Parameters: None
-- Note: The weighted score is computed based on project weights and correction scores.
--       If a user has no scores, their average weighted score is set to 0.

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    -- Update the average_score for all users
    UPDATE users u
    LEFT JOIN (
        SELECT 
            c.user_id,
            COALESCE(SUM(c.score * p.weight) / SUM(p.weight), 0) AS weighted_avg
        FROM 
            corrections c
        INNER JOIN 
            projects p ON c.project_id = p.id
        GROUP BY 
            c.user_id
    ) AS weighted_scores ON u.id = weighted_scores.user_id
    SET u.average_score = COALESCE(weighted_scores.weighted_avg, 0);
END //

DELIMITER ;
