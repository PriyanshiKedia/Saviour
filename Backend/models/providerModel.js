const mongoose = require('mongoose');

const providerSchema = new mongoose.Schema({
    organisation: {
        type: String,
        required: true,
        unique: true,
        trim: true,
    },
    address: {
        type: String,
        required: true,
        trim: true,
    },
    password: {
        type: String,
        required: true,
    },
    code: {
        type: String,
        required: true,
        unique: true,
    }
});

const Provider = mongoose.model('Provider', providerSchema);

module.exports = Provider;
