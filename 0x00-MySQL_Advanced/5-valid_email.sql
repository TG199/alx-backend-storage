-- Create a trigger to reset 'valid_email' when the 'email' field is updated
DELIMITER //

CREATE TRIGGER reset_valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the 'email' field is being updated
    IF OLD.email <> NEW.email THEN
        -- Reset 'valid_email' if 'email' has been changed
        SET NEW.valid_email = FALSE; -- or 0, depending on your data type
    END IF;
END;

//

DELIMITER ;
