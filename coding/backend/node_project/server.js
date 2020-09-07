const express = require("express");
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const app = express();
const PORT = 3000;
const { mongoUrl } = require("./src/keys");

require("./src/models/User");
const profile = require("./src/routes/users");

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  next();
});

app.use(bodyParser.json());
app.use(profile);


mongoose.connect(mongoUrl, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

mongoose.connection.on("connected", () => {
  console.log("connected to mongodb");
});

mongoose.connection.on("error", (err) => {
  console.log("this is error", err);
});

// app.get("/", requireToken, (req, res) => {
//   res.send("your email is " + req.user.email);
// });

// app.use(bodyParser.json());


app.listen(PORT, () => {
  console.log("server running: " + PORT);
});