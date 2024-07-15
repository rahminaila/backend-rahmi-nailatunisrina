const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('detil_transaksi', {
    id_detil_transaksi: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    id_transaksi: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'transaksi',
        key: 'id_transaksi'
      }
    },
    id_product: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'product',
        key: 'id_product'
      }
    },
    jumlah_product: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    harga_detil_transaksi: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'detil_transaksi',
    schema: 'marketplace',
    timestamps: false,
    indexes: [
      {
        name: "detil_transaksi_pkey",
        unique: true,
        fields: [
          { name: "id_detil_transaksi" },
        ]
      },
    ]
  });
};
