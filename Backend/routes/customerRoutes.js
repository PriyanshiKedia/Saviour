const express = require('express');
const middleware = require('../middleware');
const jwt = require('jsonwebtoken');
const Customer = require('../models/customerModel');
const router = express.Router();

router.route('/register').post((req, res) => {
    const customer = new Customer({
        username: req.body.username,
        email: req.body.email,
        password: req.body.password,
        phone: req.body.phone,
    });
    customer
        .save()
        .then(() => {
            console.log('Customer Registered!');
            res.status(200).json('Ok');
        })
        .catch((err) => {
            res.status(403).json({ msg: err });
        });
});

router.route('/login').post((req, res) => {
    Customer.findOne({ email: req.body.email }, (err, result) => {
        if (err) {
            return res.status(500).json({ msg: err });
        } else if (result == null) {
            return res.status(403).json({ msg: 'User does not exist' });
        } else if (result.password == req.body.password) {
            let token = jwt.sign({ email: req.body.email }, 'ThirdSemProj@123', {
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

router.route('/checkEmail/:email').get((req, res) => {
    Customer.findOne({ email: req.params.email }, (err, result) => {
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