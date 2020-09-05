const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const validator = require("validator");

const userSchema = new mongoose.Schema({
  email: {
    type: String,
    unique: true,
    required: true,
    trim: true,
    minlength: 1,
    validate: {
      validator: validator.isEmail,
      message: "{Value} is not a valid email",
    },
  },
  name: {
    type: String,
    required: true,
  },

  mobile: {
    type: String,
    unique: true,
    required: true,
  },

  dob: {
    type: Date,
    required: true,
  },

  createdat: {
    type: Date,
  },
  modifiedat: {
    type: Date,
    default: Date.now(),
  },
});

mongoose.model("User", userSchema);