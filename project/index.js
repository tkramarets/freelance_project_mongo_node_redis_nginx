const express = require('express');
const mongoose = require("mongoose");


const app = express();

let errM = '';

app.get('/', (req, res) => {
  res.send(`hello world from server env => ${JSON.stringify(process.env)} and error mongo => ${errM}`)
})

app.listen(process.env.PORT || 3000, async (err) => {
  if (err) throw new Error(err);

  const mongo = await mongoose.connect(
    "mongodb://root:root@mongo1:27017/test?authSource=admin",
    {
      useUnifiedTopology: true,
      useNewUrlParser: true, 
    }
  ).then(() => {
    errM = 'SUCCESS CONNECT TO MONGO';
    console.log("SERVER STARTED AND CONNECT SUCCESS")
  }).catch((err) => {
    errM = err;
    console.log("SERVER STARTED AND CONNECT FAILED");
  });

  
});


// npm WARN saveError ENOENT: no such file or directory, open '/docker-mongo/package.json'
// npm notice created a lockfile as package-lock.json. You should commit this file.
// npm WARN enoent ENOENT: no such file or directory, open '/docker-mongo/package.json'
// npm WARN docker-mongo No description
// npm WARN docker-mongo No repository field.
// npm WARN docker-mongo No README data
// npm WARN docker-mongo No license field.