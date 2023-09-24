require('dotenv').config()
const express = require('express');

const app = express();

const PORT = process.env.PORT;

app.use(express.json());
app.use(express.urlencoded({extended: true}))

//simple route to practice kubernetes minikube version

app.get('/hello', (req,res)=>{
    res.status(200).json({
        msg:'HI imran',
        path: req.path
    })
})



app.listen(PORT, ()=>{
    console.log('*** Server started on port ***: ', PORT)
})