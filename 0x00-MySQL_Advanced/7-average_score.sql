-- Create the ComputeAverageScoreForUser stored procedure
DELIMITER //

-- Procedure: ComputeAverageScoreForUser
-- Description: This procedure computes and stores the average score for a student.
-- Parameters:
--   p_user_id INT - The ID of the user (student) for whom to compute the average score
-- Note: The average score is computed from the corrections table and stored in the users table.
--       If the user has no scores, their average is set to 0.

CREATE PROCEDURE ComputeAverageScoreForUser(
    IN p_user_id INT
)
BEGIN
    -- Declare a variable to store the average score
    -- Using DECIMAL(5,2) allows for scores like 100.00, 99.99, etc.
    DECLARE v_avg_score DECIMAL(5,2);

    -- Compute the average score for the given user
    -- AVG() function ignores NULL values
    SELECT AVG(score) INTO v_avg_score
    FROM corrections
    WHERE user_id = p_user_id;

    -- If there are no scores for the user, AVG() will return NULL
    -- In this case, we set the average to 0
    IF v_avg_score IS NULL THEN
        SET v_avg_score = 0;
    END IF;

    -- Update the average score for the user in the users table
    -- This assumes there's an average_score column in the users table
    UPDATE users
    SET average_score = v_avg_score
    WHERE id = p_user_id;

    -- Note: The procedure doesn't return anything, it directly updates the users table
END //

DELIMITER ;
