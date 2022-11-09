const express = require('express');
const app = express(),
      bodyParser = require("body-parser");
      port = 3080;
const path = require('path')
const users = [];
// const pa = require('../../UX/Angular')

app.use(express.static("./"))
app.use((req,res)=>{
    console.log(__dirname)
    res.sendFile(path.join(__dirname + '/index.html'));
})




app.listen(port, () => {
    console.log(`Server listening on the port::${port}`);
});