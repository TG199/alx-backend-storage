-- Create the procedure ComputeAverageWeightedScoreForUser
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    IN user_id INT
)
BEGIN
    DECLARE weighted_sum DECIMAL(10, 2);
    DECLARE total_weight DECIMAL(10, 2);
    DECLARE average_weighted_score DECIMAL(10, 2);

    -- Calculate the weighted sum of the scores for the given user_id
    SELECT 
        SUM(score * weight) INTO weighted_sum,
        SUM(weight) INTO total_weight
    FROM 
        scores
    WHERE 
        user_id = user_id;

    -- Check if total_weight is not zero to avoid division by zero
    IF total_weight > 0 THEN
        SET average_weighted_score = weighted_sum / total_weight;
    ELSE
        SET average_weighted_score = 0;
    END IF;

    -- Insert or update the average weighted score for the user in the weighted_scores table
    INSERT INTO weighted_scores (user_id, average_weighted_score)
    VALUES (user_id, average_weighted_score)
    ON DUPLICATE KEY UPDATE
        average_weighted_score = VALUES(average_weighted_score);

END;
//

DELIMITER ;
