DROP DATABASE IF EXISTS league;

CREATE DATABASE league;

\c league

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE referees (
    ref_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team INT REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    match_date DATE NOT NULL,
    team1_id INT REFERENCES teams ON DELETE CASCADE,
    team2_id INT REFERENCES teams ON DELETE CASCADE,
    team1_score INT NOT NULL,
    team2_score INT NOT NULL,
    ref_id INT REFERENCES referees ON DELETE CASCADE
);

CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    match_time TIMESTAMP NOT NULL,
    match INT REFERENCES matches ON DELETE CASCADE,
    player INT REFERENCES players ON DELETE CASCADE
);