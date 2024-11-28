USE USER_ROLES

--1)Creating Table 'User_has_roles'

CREATE TABLE User_has_roles (
    id INT PRIMARY KEY ,                             
    role_start_time DATETIME,                     
    role_end_time DATETIME,                       
    user_account_id INT,                           
    role_id INT                                    
);

-- Insert 1st record
INSERT INTO User_has_roles (id, role_start_time, role_end_time, user_account_id, role_id)
VALUES (1, '2024-11-01 09:00:00', '2024-11-30 17:00:00', 1, 101);

-- Insert 2nd record
INSERT INTO User_has_roles (id, role_start_time, role_end_time, user_account_id, role_id)
VALUES (2, '2024-12-01 09:00:00', '2024-12-31 17:00:00', 2, 102);

SELECT*FROM User_has_roles;

--2)Creating Table 'Roles'

CREATE TABLE Roles (
    id INT PRIMARY KEY,              -- Primary key for the Role table
    role_name VARCHAR(100)           -- Column to store role names (up to 100 characters)
);
-- Insert 1st role
INSERT INTO Roles (id, role_name)
VALUES (1, 'Admin');

-- Insert 2nd role
INSERT INTO Roles (id, role_name)
VALUES (2, 'User');

SELECT* FROM Roles;

--3)Creating Table User_accounts

CREATE TABLE User_accounts (
    id INT PRIMARY KEY,                             
    user_name VARCHAR(100),                        
    email VARCHAR(254),                            
    password VARCHAR(200),                         
    password_salt VARCHAR(50),                      
    password_hash_algorithm VARCHAR(50)             
);

-- Insert user account
INSERT INTO User_accounts (id, user_name, email, password, password_salt, password_hash_algorithm)
VALUES (1, 'john_doe', 'john.doe@example.com', 'hashed_password_value', 'random_salt_value', 'SHA-256');
INSERT INTO User_accounts (id, user_name, email, password, password_salt, password_hash_algorithm)
VALUES (2, 'jane_smith', 'jane.smith@example.com', 'another_hashed_password_value', 'another_random_salt_value', 'bcrypt');

SELECT*FROM User_accounts;

--4)Creating Table 'statuses'

CREATE TABLE Statuses (
    id INT PRIMARY KEY,              
    status_name VARCHAR(100),        
    is_user_working BIT              
);

-- Insert sample statuses into the Status table
INSERT INTO Statuses (id, status_name, is_user_working)
VALUES (1, 'Active', 1); --TRUE

INSERT INTO Statuses (id, status_name, is_user_working)
VALUES (2, 'Inactive', 0);  ---FALSE

SELECT* FROM Statuses;

--5)Creating Table 'User_has_status'

CREATE TABLE user_has_status (
    id INT PRIMARY KEY,                            
    status_start_time datetime,                  
    status_end_time datetime,                     
    user_account_id INT,                           
    status_id INT,                                 
    FOREIGN KEY (user_account_id) REFERENCES User_accounts(id),  -- Foreign key reference to User_accounts
    FOREIGN KEY (status_id) REFERENCES Statuses(id)              -- Foreign key reference to Statuses table
);

-- Insert a record into user_has_status with valid references to Statuses and User_accounts
INSERT INTO user_has_status (id, status_start_time, status_end_time, user_account_id, status_id)
VALUES (1, '2024-11-01 08:00:00', '2024-11-01 12:00:00', 1, 1);  -- Assuming user_account_id = 1 and status_id = 1

INSERT INTO user_has_status (id, status_start_time, status_end_time, user_account_id, status_id)
VALUES (2, '2024-11-01 14:00:00', '2024-11-01 18:00:00', 2, 2);  -- user_account_id = 2 and status_id = 2 (Inactive)

SELECT*FROM user_has_status;