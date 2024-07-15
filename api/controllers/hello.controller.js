const httpStatus = require('http-status');

exports.hello = async (req, res) => {
  return res.json({status: "OK", message: "Welcome to Market Place"})
};