const express = require('express');
const pool = require('./pool');

const router = express.Router();

router.get('/projects', (req, res) => {
   const queryText = `SELECT * FROM "projects";`;

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
