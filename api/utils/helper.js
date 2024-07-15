const crypto = require('crypto');

const generate_token = () => {
  const token = crypto.randomBytes(64).toString('hex');
  return token;
}

module.exports = {
  generate_token
}