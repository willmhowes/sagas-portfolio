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
    "date_completed" date
);

CREATE TABLE "project_tags" (
    "id" SERIAL PRIMARY KEY,
    "project_id" INT REFERENCES "projects",
    "tag_id" INT REFERENCES "tags"
);

INSERT INTO "tags" ("name")
VALUES ('React'), ('jQuery'), ('Node'), ('SQL'), ('Redux'), ('HTML');

INSERT INTO "projects" ("name", "description", "github", "date_completed")
VALUES ('To-Do List App', 'simply manages a list of tasks', 'https://github.com/willmhowes/weekend-sql-to-do-list', '2019-04-01');

INSERT INTO "project_tags" ("project_id", "tag_id")
VALUES
(1, 2),
(1, 3),
(1, 4);

-- Demo for getting projects and their tags
SELECT "projects"."name", "tags"."name" AS "tags" FROM "project_tags"
JOIN "projects" ON "projects"."id" = "project_tags"."project_id"
JOIN "tags" ON "tags"."id" = "project_tags"."tag_id";
