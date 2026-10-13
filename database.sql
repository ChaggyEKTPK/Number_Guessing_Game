CREATE TABLE Users(
ID SERIAL PRIMARY KEY,
username varchar(22) NOT NULL UNIQUE,
games_played int DEFAULT 0,
best_game int DEFAULT NULL
);
