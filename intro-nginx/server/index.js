const express = require('express');

app = express();

app.get('/', (req, res) => {
    res.send('I am a simple node application');
    });

app.listen(7777, () => {
    console.log('Server is running on http://localhost:7777');
    }
)