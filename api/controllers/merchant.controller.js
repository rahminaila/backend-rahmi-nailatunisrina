const httpStatus = require('http-status');
const controller = {};
const service = require("../services/index");


exports.createProduct = async (req, res) => {
    try {
        const product = req.body;
        await service.insertProduct(product);

        return res.status(200).json({ code: 200, status: "success", message: "Berhasil menambahkan", data: product })
    } catch (err) {
        console.log(err)
        return res.status(500).json({
            kode: 500,
            keterangan: "Internal Server Error",
            data: {
                kode: '005',
                keterangan: err.message
            }
        })
    }
};

exports.updateProduct = async (req, res) => {
    try {
        const product = req.body;
        await service.updateProduct(product.namaProduct, product.deskripsi, product.harga, product.idProduct, product.stock);

        return res.status(200).json({ code: 200, status: "success", message: "Berhasil update data", data: product })
    } catch (err) {
        console.log(err)
        return res.status(500).json({
            kode: 500,
            keterangan: "Internal Server Error",
            data: {
                kode: '005',
                keterangan: err.message
            }
        })
    }
};

exports.deleteProduct = async (req, res) => {
    try {
        const product = req.body;
        const deleteProduct = await service.deleteProduct(product.idProduct);

        return res.status(200).json({ code: 200, status: "success", message: "Berhasil delete data", data: deleteProduct })
    } catch (err) {
        console.log(err)
        return res.status(500).json({
            kode: 500,
            keterangan: "Internal Server Error",
            data: {
                kode: '005',
                keterangan: err.message
            }
        })
    }
};

exports.getListCustomer = async (req, res) => {
    try {
        const merchant = req.query.idMerchant;
        let listCustomer = await service.getListCustomer(merchant);

        return res.status(200).json({ code: 200, status: "success", message: "Berhasil melihat list customer", data: listCustomer })
    } catch (err) {
        console.log(err)
        return res.status(500).json({
            kode: 500,
            keterangan: "Internal Server Error",
            data: {
                kode: '005',
                keterangan: err.message
            }
        })
    }
};