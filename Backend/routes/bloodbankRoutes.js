const express = require('express');
const Bloodbank = require('../models/bloodbankModel');

const router = express.Router();

router.route('/register').post((req, res) => {
  const bloodbank = new Bloodbank({
    name: req.body.name,
    type: req.body.type,
    amount: req.body.amount,
  });
  bloodbank
    .save()
    .then(() => {
      console.log('BloodBank form filled');
      res.status(200).json('Ok');
    })
    .catch((err) => {
      res.status(403).json({ msg: err });
    });
});

router.route('/getBloodbank').get((req, res) => {
  Bloodbank.find((err, result) => {
    if (err) return res.json(err);
    return res.json({ data: result });
  });
});

module.exports = router;
