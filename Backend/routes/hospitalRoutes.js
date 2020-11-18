const express = require('express');
const Hospital = require('../models/hospitalModel');

const router = express.Router();

router.route('/register').post((req, res) => {
    const hospital = new Hospital({
        name: req.body.name,
        bed: req.body.bed,
    });
    hospital
        .save()
        .then(() => {
            console.log('Hospital form filled');
            res.status(200).json('Ok');
        })
        .catch((err) => {
            res.status(403).json({ msg: err });
        });
});

router.route('/getHospital').get((req, res) => {
    Hospital.find((err, result) => {
        if (err) return res.json(err);
        return res.json({ data: result });
    });
});

module.exports = router;
