-- Create the ComputeAverageScoreForUser stored procedure
DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(
    IN p_user_id INT                   -- User ID for which to compute the average score
)
BEGIN
    DECLARE avg_score DECIMAL(10, 2);  -- Variable to store the computed average score

    -- Initialize avg_score to 0 to handle cases where there are no scores
    SET avg_score = 0;

    -- Compute the average score for the given user
    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE user_id = p_user_id;

    -- Insert or update the average score in the average_scores table
    INSERT INTO average_scores (user_id, average_score)
    VALUES (p_user_id, avg_score)
    ON DUPLICATE KEY UPDATE
        average_score = avg_score;
END;

//

DELIMITER ;
