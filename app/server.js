const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Middlewares
app.use(express.json());

// Routes
app.get('/health', (req, res) => res.send('OK'));
app.use('/api/users', require('./routes/users'));

// Server
app.listen(port, () => {
  console.log(`FortiStack API running on port ${port}`);
});
