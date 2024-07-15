const service = {}
const db = require("../config/database")

exports.insertProduct = async (data) => {
    let query = `INSERT INTO marketplace.product
      (nama_product, deskripsi, harga, id_merchant, stock)
      values($1, $2, $3, $4, $5)`
    const values = [data.namaProduct, data.deskripsi, data.harga, data.idMerchant, data.stock]

    const result = await db.query(query, {
        bind: values,
        type: db.QueryTypes.INSERT,
    });

    return "Success insert";
};

exports.updateProduct = async (
    nama_product,
    deskripsi,
    harga,
    id_product,
    stock
) => {
    let queryUpdate = `UPDATE marketplace.product SET nama_product = :nama_product, deskripsi = :deskripsi, harga = :harga, stock = :stock
    WHERE id_product = :id_product`
    const result = await db.query(
        queryUpdate,
        {
            type: db.QueryTypes.UPDATE,
            replacements: {
                nama_product,
                deskripsi,
                harga,
                stock,
                id_product,
            }
        }
    );
    return result;
};

exports.deleteProduct = async (id_product) => {
    let queryDelete = `DELETE FROM marketplace.product WHERE id_product = :id_product`
    const result = await db.query(
        queryDelete,
        {
            type: db.QueryTypes.DELETE,
            replacements: {
                id_product
            }
        }
    );
    return result;
};

exports.getListProduct = async (nama_product) => {
    let query = `select * from marketplace.product where nama_product ilike :nama_product `
    const result = await db.query(query, {
        type: db.QueryTypes.SELECT,
        replacements: {
            nama_product: `%${nama_product}%`
        }
    }
    );
    return result;
};

exports.buyProduct = async (nama_product) => {
    let query = `select * from marketplace.product where nama_product ilike :nama_product `
    const result = await db.query(query, {
        type: db.QueryTypes.SELECT,
        replacements: {
            nama_product: `%${nama_product}%`
        }
    }
    );
    return result;
};

exports.getHargaDanStock = async (id_product) => {
    let query = `select harga, stock from marketplace.product where id_product = :id_product `
    const result = await db.query(query, {
        type: db.QueryTypes.SELECT,
        replacements: {
            id_product
        }
    }
    );
    return result[0];
};

exports.getIdTransaksiTerakhir = async (id_product) => {
    let query = `SELECT MAX(id_transaksi) AS id_transaksi_terakhir FROM marketplace.transaksi;`
    const result = await db.query(query, {
        type: db.QueryTypes.SELECT
    }
    );
    return result[0].id_transaksi_terakhir;
};

exports.insertDetilTransaksi = async (id_transaksi, id_product, jumlah_product, harga_detil_transaksi, transaction) => {
    let query = `INSERT INTO marketplace.detil_transaksi
      (id_transaksi, id_product, jumlah_product, harga_detil_transaksi)
      values($1, $2, $3, $4)`
    const values = [id_transaksi, id_product, jumlah_product, harga_detil_transaksi]

    const result = await db.query(query, {
        bind: values,
        type: db.QueryTypes.INSERT,
        transaction,
    });

    return "Success insert";
};

exports.findUser = async (email) => {
    let query = `select * from marketplace.customer where email = :email `
    const result = await db.query(query, {
        type: db.QueryTypes.SELECT,
        replacements: {
            email
        }
    }
    );
    return result;
};

exports.insertTransaksi = async (idCustomer, isGratisOngkir, isDiskon, diskonValue, hargaOngkir, totalHargaSebelumDiskon, totalSemua, transaction,) => {
    let query = `INSERT INTO marketplace.transaksi
      (id_customer, tanggal_order, is_gratis_ongkir, is_diskon, diskon_value, harga_ongkir, total_harga_product_sebelum_diskon, total_semuanya)
      values($1, now(), $2, $3, $4, $5, $6, $7)`
    const values = [idCustomer, isGratisOngkir, isDiskon, diskonValue, hargaOngkir, totalHargaSebelumDiskon, totalSemua]

    const result = await db.query(query, {
        bind: values,
        type: db.QueryTypes.INSERT,
        transaction,
    });

    return "Success insert";
};

exports.updateStock = async (
    stock,
    id_product, 
    transaction
) => {
    let queryUpdate = `UPDATE marketplace.product SET stock = :stock
    WHERE id_product = :id_product`
    const result = await db.query(
        queryUpdate,
        {
            type: db.QueryTypes.UPDATE,
            replacements: {
                stock,
                id_product,
            }, transaction
        }
    );
    return result;
};

exports.getListCustomer = async (id_merchant) => {
    let query = `select c.nama_customer,p.nama_product ,dt.jumlah_product, t.tanggal_order  
    from marketplace.transaksi t 
join marketplace.detil_transaksi dt on t.id_transaksi = dt.id_transaksi 
join marketplace.product p on p.id_product = dt.id_product 
join marketplace.customer c on c.id_customer = t.id_customer 
where p.id_merchant = id_merchant`
    const result = await db.query(query, {
        type: db.QueryTypes.SELECT,
        replacements: {
            id_merchant
        }
    }
    );
    return result;
};