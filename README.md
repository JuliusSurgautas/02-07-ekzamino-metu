# Project: User Management and Advertisement System

This project involves managing users, advertisements, services, comments, and ratings within a relational database. The database supports functionalities like creating, reading, updating, and deleting records for users and their related data (advertisements, services, comments, and ratings).

## Database Structure

The database consists of the following tables:

### 1. **Users Table**
This table stores the details of users who can post advertisements and services, comment, and provide ratings.

| Column Name  | Data Type         | Description                        |
|--------------|-------------------|------------------------------------|
| `user_id`    | SERIAL            | Primary key, unique identifier for each user |
| `username`   | VARCHAR(50)       | Username of the user (must be unique) |
| `email`      | VARCHAR(100)      | Email address of the user (must be unique) |
| `password`   | VARCHAR(255)      | The password for user authentication |
| `created_at` | TIMESTAMP         | The timestamp when the user was created |
| `updated_at` | TIMESTAMP         | The timestamp when the user was last updated |

### 2. **Advertisements Table**
This table stores the advertisements posted by users.

| Column Name  | Data Type         | Description                         |
|--------------|-------------------|-------------------------------------|
| `ad_id`      | SERIAL            | Primary key, unique advertisement ID |
| `user_id`    | INT               | Foreign key to the `users` table (who posted the ad) |
| `title`      | VARCHAR(255)      | Title of the advertisement         |
| `category`   | VARCHAR(255)      | Category of the advertisement      |
| `description`| TEXT              | Description of the advertisement   |
| `price`      | DECIMAL(10, 2)    | Price listed for the advertisement |
| `created_at` | TIMESTAMP         | The timestamp when the ad was created |
| `updated_at` | TIMESTAMP         | The timestamp when the ad was last updated |

### 3. **Services Table**
This table stores the services offered by users.

| Column Name         | Data Type         | Description                         |
|---------------------|-------------------|-------------------------------------|
| `service_id`        | SERIAL            | Primary key, unique service ID     |
| `user_id`           | INT               | Foreign key to the `users` table   |
| `service_name`      | VARCHAR(100)      | Name of the service                |
| `service_description`| TEXT             | Description of the service         |
| `created_at`        | TIMESTAMP         | The timestamp when the service was created |
| `updated_at`        | TIMESTAMP         | The timestamp when the service was last updated |

### 4. **Comments Table**
This table stores comments on advertisements posted by users.

| Column Name  | Data Type         | Description                         |
|--------------|-------------------|-------------------------------------|
| `comment_id` | SERIAL            | Primary key, unique comment ID      |
| `ad_id`      | INT               | Foreign key to the `advertisements` table |
| `user_id`    | INT               | Foreign key to the `users` table   |
| `comment_text`| TEXT             | The text of the comment            |
| `created_at` | TIMESTAMP         | The timestamp when the comment was created |

### 5. **Ratings Table**
This table stores ratings given by users to advertisements.

| Column Name | Data Type         | Description                         |
|-------------|-------------------|-------------------------------------|
| `rating_id` | SERIAL            | Primary key, unique rating ID       |
| `ad_id`     | INT               | Foreign key to the `advertisements` table |
| `user_id`   | INT               | Foreign key to the `users` table   |
| `rating`    | INT               | Rating value (1-5)                  |
| `created_at`| TIMESTAMP         | The timestamp when the rating was given |

## SQL Operations

### 1. **Inserting Data**
To insert a new user into the `users` table:

```sql
INSERT INTO users (username, email, password, created_at, updated_at)
VALUES ('john_doe', 'john@example.com', 'password123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
# CRUD Operations for User Management and Advertisement System

This project involves the management of users, advertisements, services, comments, and ratings. The operations provided allow users to **Create**, **Read**, **Update**, and **Delete** data from the respective tables. This document explains the CRUD operations implemented in the database and provides SQL commands for interacting with the system.

## Table of Contents
1. [Introduction](#introduction)
2. [CRUD Operations](#crud-operations)
   - [Create Operation](#1-create)
   - [Read Operation](#2-read)
   - [Update Operation](#3-update)
   - [Delete Operation](#4-delete)
3. [SQL Examples for CRUD](#sql-examples-for-crud)
4. [Advanced CRUD Features](#advanced-crud-features)
5. [Best Practices](#best-practices)

## Introduction

The project database consists of several tables related to user management and advertisements. The key tables are:

- **Users**: Stores user information like `username`, `email`, and `password`.
- **Advertisements**: Stores advertisements posted by users, including the `title`, `description`, `price`, etc.
- **Services**: Stores services offered by users.
- **Comments**: Stores comments related to advertisements.
- **Ratings**: Stores ratings provided by users for advertisements.

The following CRUD operations are implemented to manage these tables:

---

## CRUD Operations

CRUD stands for **Create**, **Read**, **Update**, and **Delete**, the four basic operations for managing data in a relational database.

### 1. **Create**

The **Create** operation allows inserting new records into the database.

#### Example SQL Command:

**Create a new user:**

```sql
INSERT INTO users (username, email, password, created_at, updated_at)
VALUES ('alice_smith', 'alice@example.com', 'password123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
