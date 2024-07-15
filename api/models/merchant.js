const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('merchant', {
    id_merchant: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    nama: {
      type: DataTypes.STRING(255),
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'merchant',
    schema: 'marketplace',
    timestamps: false,
    indexes: [
      {
        name: "merchant_pkey",
        unique: true,
        fields: [
          { name: "id_merchant" },
        ]
      },
    ]
  });
};
