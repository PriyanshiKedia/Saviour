const mongoose = require('mongoose');

const bloodbankSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    unique: true,
    trim: true,
  },
  type: {
    type: String,
    required: true,
    trim: true,
  },
  amount: {
    type: String,
    required: true,
  },
});

const Bloodbank = mongoose.model('Bloodbank', bloodbankSchema);

module.exports = Bloodbank;
