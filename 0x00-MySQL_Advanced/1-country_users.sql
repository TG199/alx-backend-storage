-- Create a table named 'users' with the specified attributes
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,      -- Integer, never null, auto-increment, primary key
    email VARCHAR(255) NOT NULL UNIQUE,     -- Email string (255 characters), never null, unique
    name VARCHAR(255),                       -- Name string (255 characters)
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US' -- Country, enumeration of countries, never null with default 'US'
)
