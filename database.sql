CREATE TABLE "tags" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(255) NOT NULL
);

CREATE TABLE "projects" (
    "id" SERIAL PRIMARY KEY,
    "name" varchar(255) NOT NULL,
    "description" varchar(2048),
    "thumbnail" varchar(2048),
    "website" varchar(2048),
    "github" varchar(2048),
    "date_completed" date,
    "tag_id" INT REFERENCES "tags"
);

INSERT INTO "tags" ("name")
VALUES ('React'), ('jQuery'), ('Node'), ('SQL'), ('Redux'), ('HTML');

INSERT INTO "projects" ("name", "description", "github", "date_completed", "tag_id")
VALUES ('To-Do List App', 'simply manages a list of tasks', 'https://github.com/willmhowes/weekend-sql-to-do-list', '2019-04-01', 2);
