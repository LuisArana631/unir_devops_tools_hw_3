const mongoose = require('mongoose');

let URI = process.env.DB_CNN;

mongoose.connect(URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(db => console.log('Db is connected'))
  .catch(error => console.error(error));

module.exports = mongoose;
