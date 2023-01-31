DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region (
    region_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories (
    cat_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT,
    pref_region INTEGER REFERENCES region ON DELETE CASCADE
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author INTEGER REFERENCES users ON DELETE CASCADE,
    location_name TEXT NOT NULL,
    region INTEGER REFERENCES region ON DELETE CASCADE,
    category INTEGER REFERENCES categories ON DELETE CASCADE
);