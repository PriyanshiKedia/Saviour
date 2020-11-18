const express = require('express');
const providerRoutes = require('./routes/providerRoutes');
const bloodbankRoutes = require('./routes/bloodbankRoutes');
const hospitalRoutes = require('./routes/hospitalRoutes');
const customerRoutes = require('./routes/customerRoutes');


const app = express();

//MIDDLEWARE

app.use(express.json());

// app.use((req, res, next) => {
//   req.requestTime = new Date().toISOString();
//   next();
// });

//ROUTE MANGAGER

app.use('/api/v1/providers', providerRoutes);
app.use('/api/v1/bloodbank', bloodbankRoutes);
app.use('/api/v1/hospital', hospitalRoutes);
app.use('/api/v1/customers', customerRoutes);

module.exports = app;