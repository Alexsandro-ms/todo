CREATE DATABASE IF NOT EXISTS todo;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE task_status AS ENUM ('pending', 'in_progress', 'completed', 'canceled');

CREATE TABLE IF NOT EXISTS user (
    id UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
    image_path VARCHAR,
    name VARCHAR NOT NULL,
    email VARCHAR UNIQUE,
    phone VARCHAR,
    password VARCHAR UNIQUE,
    reset_password_token VARCHAR,
    reset_password_expires TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tasks (
    id UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
    title VARCHAR NOT NULL,
    description VARCHAR,
    due_date TIMESTAMP,
    status task_status NOT NULL DEFAULT 'pending'::task_status,
    user_id UUID,
    FOREIGN KEY(user_id) REFERENCES user(id)
)