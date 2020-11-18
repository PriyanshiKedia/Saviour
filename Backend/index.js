// const { Mongoose } = require("mongoose")

const app = require('./app');
const mongoose = require('mongoose');

mongoose
    .connect(
        'mongodb+srv://priyanshi22:priyanshi22@cluster0.dsvw4.mongodb.net/project?retryWrites=true&w=majority',
        {
            useNewUrlParser: true,
            useCreateIndex: true,
            useFindAndModify: false,
            useUnifiedTopology: true,
        }
    )
    .then(() => console.log('Db connection successful'));

const port = 8000;
app.listen(port, () => {
    console.log(`App running on port ${port}`);
});

mongoose.connect()

