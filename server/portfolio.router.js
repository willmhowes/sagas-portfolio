const express = require('express');
const pool = require('./pool');

const router = express.Router();

router.get('/projects', (req, res) => {
   const queryText = `SELECT "projects"."id", "projects"."name",
      "projects"."description", "projects"."thumbnail",
      "projects"."website", "projects"."github",
      "projects"."date_completed","projects"."tag_id",
      "tags"."name" FROM "projects"
      JOIN "tags" ON "tags"."id" = "projects"."tag_id";`;

   pool.query(queryText)
      .then((result) => {
         res.send(result.rows);
      }).catch((err) => {
         console.log('Error getting project data', err);
         res.sendStatus(500);
      });
});

router.get('/tags', (req, res) => {
   const queryText = `SELECT * FROM "tags";`;

   pool.query(queryText)
      .then((result) => {
         res.send(result.rows);
      }).catch((err) => {
         console.log('Error getting tag data', err);
         res.sendStatus(500);
      });
});

module.exports = router;
