const User = require('../models/customer'); // Ganti dengan model pengguna Anda
const bcrypt = require('bcryptjs');
const service = require("../services/index");
const jwt = require('jsonwebtoken');


exports.getToken = async (req, res) => {
    let user = await service.findUser(req.body.email);

    if (user.length == 0) {
        return res.status(404).send({ message: 'User Not found.' });
    }

    const token = jwt.sign({ id: user.id }, 'your-secret-key', {
        expiresIn: 86400 // 24 hours
    });

    res.status(200).send({
        id: user._id,
        email: user.email,
        accessToken: token
    });
};