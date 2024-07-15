const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('product', {
    id_product: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    nama_product: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    deskripsi: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    harga: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    id_merchant: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'merchant',
        key: 'id_merchant'
      }
    }
  }, {
    sequelize,
    tableName: 'product',
    schema: 'marketplace',
    timestamps: false,
    indexes: [
      {
        name: "aproduct_pkey",
        unique: true,
        fields: [
          { name: "id_product" },
        ]
      },
    ]
  });
};
