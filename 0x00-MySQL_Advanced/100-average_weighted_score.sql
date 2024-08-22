-- Create the procedure ComputeAverageWeightedScoreForUser

DELIMITER //

-- Procedure: ComputeAverageWeightedScoreForUser
-- Description: This procedure computes and stores the average weighted score for a student.
-- Parameters:
--   p_user_id INT - The ID of the user (student) for whom to compute the average weighted score
-- Note: The weighted score is computed based on project weights and correction scores.
--       If the user has no scores, their average weighted score is set to 0.

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    IN p_user_id INT
)
BEGIN
    DECLARE v_weighted_avg_score DECIMAL(10,2);

    -- Compute the weighted average score
    SELECT COALESCE(SUM(corrections.score * projects.weight) / SUM(projects.weight), 0)
    INTO v_weighted_avg_score
    FROM corrections
    INNER JOIN projects ON corrections.project_id = projects.id
    WHERE corrections.user_id = p_user_id;

    -- Update the average_score in the users table
    UPDATE users
    SET average_score = v_weighted_avg_score
    WHERE id = p_user_id;
END //

DELIMITER ;
