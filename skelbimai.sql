-- Users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,                    -- Add user_id as a SERIAL primary key
    username VARCHAR(50) NOT NULL,                    
    email VARCHAR(100) UNIQUE NOT NULL,               
    password VARCHAR(255) NOT NULL,                   
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);

-- Advertisements table
CREATE TABLE advertisements (
    ad_id SERIAL PRIMARY KEY,           -- Use SERIAL instead of AUTO_INCREMENT
    user_id INT,                                     
    title VARCHAR(255) NOT NULL,    
    Category VARCHAR(255) NOT NULL,              
    description TEXT,                                 
    price DECIMAL(10, 2),                             
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   
    FOREIGN KEY (user_id) REFERENCES users(user_id)   -- Ensure user_id is referencing users(user_id)
);

-- Services table
CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,        -- Use SERIAL instead of AUTO_INCREMENT
    user_id INT,                                      
    service_name VARCHAR(100) NOT NULL,              
    service_description TEXT,                       
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   
    FOREIGN KEY (user_id) REFERENCES users(user_id)   -- Ensure user_id is referencing users(user_id)
);

-- Comments table
CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,        -- Use SERIAL instead of AUTO_INCREMENT
    ad_id INT,                                      
    user_id INT,                                     
    comment_text TEXT NOT NULL,                      
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (ad_id) REFERENCES advertisements(ad_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)  -- Ensure user_id is referencing users(user_id)
);

-- Ratings table
CREATE TABLE ratings (
    rating_id SERIAL PRIMARY KEY,         -- Use SERIAL instead of AUTO_INCREMENT
    ad_id INT,                                        
    user_id INT,                                      
    rating INT CHECK (rating >= 1 AND rating <= 5),    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    
    FOREIGN KEY (ad_id) REFERENCES advertisements(ad_id), 
    FOREIGN KEY (user_id) REFERENCES users(user_id)  -- Ensure user_id is referencing users(user_id)
);

-- ------------------------------------Bandau ideti duomenys -----------------------------------------
INSERT INTO users (username, email, password, created_at, updated_at)
VALUES 
('john_doe', 'john@example.com', 'password123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('jane_smith', 'jane@example.com', 'password456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('alice_williams', 'alice@example.com', 'password789', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO advertisements (user_id, title, Category, description, price, created_at, updated_at)
VALUES
(1, 'Vintage Laptop', 'Electronics', 'A beautiful vintage laptop in great condition.', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Handmade Necklace', 'Fashion', 'Handmade necklace made with love and care.', 45.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Smartphone for Sale', 'Electronics', 'Latest model smartphone in excellent condition.', 500.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO services (user_id, service_name, service_description, created_at, updated_at)
VALUES
(1, 'Graphic Design', 'Professional graphic design services for logos and branding.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Pet Sitting', 'Experienced pet sitter available for hire to care for your pets.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Photography', 'Capturing your memories with professional photography services.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO comments (ad_id, user_id, comment_text, created_at)
VALUES
(1, 2, 'This laptop looks amazing, I would love to buy it!', CURRENT_TIMESTAMP),
(2, 1, 'The necklace looks so unique, would definitely recommend!', CURRENT_TIMESTAMP),
(3, 2, 'I need a new phone, this one seems perfect!', CURRENT_TIMESTAMP);

INSERT INTO ratings (ad_id, user_id, rating, created_at)
VALUES
(1, 3, 4, CURRENT_TIMESTAMP),
(2, 3, 5, CURRENT_TIMESTAMP),
(3, 1, 3, CURRENT_TIMESTAMP);






-- ----------------------------------------------------Select from -----------------------------------------------------------
SELECT * FROM users;

SELECT username, email FROM users;

SELECT * FROM users WHERE user_id = 1;

SELECT * FROM users WHERE username LIKE 'john%';

SELECT * FROM users ORDER BY created_at DESC;

SELECT * FROM users LIMIT 3;

------------------------------------------------------Delete from users-------------------------------------------------------
DELETE FROM users WHERE user_id = 1;

DELETE FROM users WHERE email = 'jane@example.com';

DELETE FROM users WHERE updated_at < '2023-01-01';

DELETE FROM users WHERE user_id = 3;

DELETE FROM users;
-------------------------------------------------------Update from users------------------------------------------------------
UPDATE users
SET email = 'new_email@example.com', password = 'newpassword123'
WHERE user_id = 1;

UPDATE users
SET password = 'newpassword456'
WHERE username LIKE 'john%';

UPDATE users
SET password = 'updatedpassword789', updated_at = CURRENT_TIMESTAMP
WHERE user_id = 2;

UPDATE users
SET username = 'new_username'
WHERE user_id = 3;

UPDATE users
SET password = 'defaultpassword', updated_at = CURRENT_TIMESTAMP
WHERE updated_at < '2024-01-01';