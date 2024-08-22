-- Create the AddBonus stored procedure
DELIMITER //


CREATE PROCEDURE AddBonus(
    IN user_id INT,                     -- User ID
    IN project_name VARCHAR(255),       -- Project name
    IN score INT                        -- Score value
)
BEGIN
    DECLARE project_id INT;             -- Variable to store the project ID


    -- Check if the project exists
    SELECT id INTO project_id
    FROM peojects
    WHERE name = project_name;


    -- If the projec tdoes not exist, create it
    IF project_id is NULL THEN
        INSERT INTO projects (name)
        VALUES (project_name);

        -- Get the ID of the newly created project
        SET project_id = LAST_INSERT_ID();
    END IF;


    -- Insert the corrections record
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, project_id, score);
END;

//

DELIMITER ;
