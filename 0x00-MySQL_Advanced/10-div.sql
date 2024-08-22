-- Create the SafeDiv function
DELIMITER //

CREATE FUNCTION SafeDiv(
    a INT,  -- First integer (numerator)
    b INT   -- Second integer (denominator)
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE result INT;

    -- Check if b is zero to avoid division by zero
    IF b = 0 THEN
        SET result = 0;
    ELSE
        -- Perform the division and store the result
        SET result = a DIV b;
    END IF;

    -- Return the result
    RETURN result;
END;
//

DELIMITER ;
