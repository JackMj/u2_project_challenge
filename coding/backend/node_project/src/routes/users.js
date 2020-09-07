const express = require("express");
const mongoose = require("mongoose");
const router = express.Router();
const User = mongoose.model("User");

// get Profiles route
module.exports = router.get("/users", async (req, res) => {
  const id = req.params._id;
  let arrayData = [];

  User.find({})
    .then((data) => {
      const status = res.statusCode;
      res.status(200).json({
        data,
      });
    })
    .catch((err) => {
      res.json({
        status,
        err,
      });
    });
});
