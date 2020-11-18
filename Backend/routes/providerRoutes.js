const express = require('express');
const middleware = require('../middleware');
const jwt = require('jsonwebtoken');
const Provider = require('../models/providerModel');
const router = express.Router();

router.route('/register').post((req, res) => {
    const provider = new Provider({
        organisation: req.body.organisation,
        address: req.body.address,
        password: req.body.password,
        code: req.body.code,
    });
    provider
        .save()
        .then(() => {
            console.log('Provider Registered!');
            res.status(200).json('Ok');
        })
        .catch((err) => {
            res.status(403).json({ msg: err });
        });
});

router.route('/login').post((req, res) => {
    Provider.findOne({ organisation: req.body.organisation }, (err, result) => {
        if (err) {
            return res.status(500).json({ msg: err });
        } else if (result == null) {
            return res.status(403).json({ msg: 'Organisation does not exist' });
        } else if (result.password == req.body.password) {
            let token = jwt.sign({ organisation: req.body.organisation }, 'ThirdSemProj@123', {
                expiresIn: '24h',
            });
            res.json({
                token: token,
                msg: 'success',
            });
        } else {
            res.status(403).json('Password is incorrect');
        }
    });
});

router.route('/checkOrganisation/:organisation').get((req, res) => {
    Provider.findOne({ organisation: req.params.organisation }, (err, result) => {
        if (err) return res.status(500).json({ msg: err });
        if (result !== null) {
            return res.json({
                Status: true,
            });
        } else
            return res.json({
                Status: false,
            });
    });
});



module.exports = router;