const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json([
    { id: 1, name: 'Doyin DevOps' },
    { id: 2, name: 'FortiStack Recruiter' }
  ]);
});

module.exports = router;
