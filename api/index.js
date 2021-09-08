// Initialize the App
const express = require('express');
const bodyParser  = require('body-parser');
const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Database
const db = require("./models");

// Routes
app.get('/', (req, res) => {
   res.json({'message': 'wellcome to Game Test API' });
});

// Create
app.post('/score/create', (req, res) => {
    let body = req.body;
    db.score.create( body )
    .then((data) => {
        res.json(data);
    })
    .catch( (error)  => {
        res.json(error);
    })
});

// Read
app.get('/score/read', (req, res) => {
    db.score.findAll({
        offset: 0, 
        limit: 5, 
        order: [
            ['score', 'desc']
        ]
    })
    .then((data) => {
        res.json(data);
    })
    .catch((error) => {
        res.json(error);
    });
    
});

// Update
app.post('/score/update', (req, res) => {
    res.json({'message': 'Score Create' });
});

// Delete
app.post('/score/delete', (req, res) => {
    res.json({'message': 'Score Create' });
});

module.exports = app.listen( 9500, () => {
    console.log( `SERVER RUNNING ON PORT: 9500`);
});
