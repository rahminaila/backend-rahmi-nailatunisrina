const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('transaksi', {
    id_transaksi: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    id_customer: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'customer',
        key: 'id_customer'
      }
    },
    tanggal_order: {
      type: DataTypes.DATE,
      allowNull: false
    },
    is_gratis_ongkir: {
      type: DataTypes.BOOLEAN,
      allowNull: false
    },
    is_diskon: {
      type: DataTypes.BOOLEAN,
      allowNull: false
    },
    diskon_value: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0
    },
    harga_ongkir: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0
    },
    total_harga_product_sebelum_diskon: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    total_semuanya: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'transaksi',
    schema: 'marketplace',
    timestamps: false,
    indexes: [
      {
        name: "transaksi_pkey",
        unique: true,
        fields: [
          { name: "id_transaksi" },
        ]
      },
    ]
  });
};
