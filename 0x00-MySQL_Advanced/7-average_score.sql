-- Create the ComputedAverageScoreForUser stored procedure
DELIMITER //


CREATE PROCEDURE ComputedAverageScoreForUser(
    IN user_id INT                     -- User ID for which to compute the average score
)
BEGIN
    DECLARE avg_score DECIMAL   (10, 2); -- Variable to store the computed average score


    -- Compute the average score for the given user
    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE user_id = user_id;


    -- If there are no corrections for the user, set the average score to NULL
    IF avg_score IS NULL THEN
        SET avg_score = 0;
    END IF;


    -- Insert or update the average score in the average_scores table
    INSERT INTo averag_scores (user_id, average_score)
    VALUES (user_id, avg_score)
    ON DUPLICATE KEY UPDATE
        average_score = avg_score;
    END;

    //

    DELIMITER ;
