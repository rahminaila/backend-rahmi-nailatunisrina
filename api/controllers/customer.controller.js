const httpStatus = require('http-status');
const controller = {};
const service = require("../services/index");
const db = require("../config/database");


exports.getListProduct = async (req, res) => {
    try {
        const product = req.query.namaProduct;
        let listProduct = await service.getListProduct(product);

        return res.status(200).json({ code: 200, status: "success", message: "Berhasil melihat list", data: listProduct })
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

exports.buyProduct = async (req, res) => {
    const transaction = await db.transaction();
    try {
        const product = req.body;
        let totalHarga = 0;
        let totalSemua = 0;
        let totalHargaSebelumDiskon = 0;
        let isGratisOngkir = false;
        let hargaOngkir = 10000;
        let isDiskon = false;
        let diskonValue = 0;
        let hargaDetil = 0;

        //get IdTransaksi terakhir
        let idTransaksiTerakhir = await service.getIdTransaksiTerakhir()
        let idTransaksi = idTransaksiTerakhir + 1;
        console.log(idTransaksi, 'id'); 


        for (const detil of product.detil) {
            let getHargaDanStock = await service.getHargaDanStock(detil.idProduct)
            console.log(getHargaDanStock.stock, 'stok');

            if ((getHargaDanStock.stock - detil.jumlah) < 0) {
                return res.status(200).json({ code: 200, status: "success", message: "Jumlah melebihi stock" })
            }
            console.log(getHargaDanStock.harga, 'harga');
            hargaDetil = getHargaDanStock.harga * detil.jumlah

            //insert detil transaksi
            let insertDetilTransaksi = await service.insertDetilTransaksi(idTransaksi, detil.idProduct, detil.jumlah, hargaDetil, transaction);

            //update stock
            stockTerbaru = getHargaDanStock.stock - detil.jumlah
            let updateStock = await service.updateStock(stockTerbaru, detil.idProduct, transaction);

            totalHarga += hargaDetil;
        }

        totalHargaSebelumDiskon = totalHarga;
        if (totalHarga > 15000) {
            isGratisOngkir = true;
            hargaOngkir = 0;
        }
        if (totalHarga > 50000) {
            isDiskon = true;
            diskonValue = 10;
            totalHarga = (100 - diskonValue) / 100 * totalHarga
        }
        totalSemua = totalHarga + hargaOngkir;

        //insert ke tabel transaksi
        let insertTransaksi = await service.insertTransaksi(product.idCustomer, isGratisOngkir, isDiskon, diskonValue, hargaOngkir, totalHargaSebelumDiskon, totalSemua, transaction);


        return res.status(200).json({ code: 200, status: "success", message: "Berhasil membeli produk"})
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