const httpStatus = require('http-status');
const controller = {};
const service = require("../services/index");

exports.cek = async (req, res) => {
  return res.json({ status: "OK", message: "Welcome to Market Place" })
};