const express = require("express");
const mongoose = require("mongoose");
const router = express.Router();
const User = mongoose.model("User");

// get Profiles route
router.get("/users", async (req, res) => {
  const id = req.params._id;
  User.find({})
    .then((data) => {
      const status = res.statusCode;
      res.status(200).json({
        status,
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