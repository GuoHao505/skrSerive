const express = require("express");
const router = express.Router();
const {
  getBrandList,
  deleteBrand,
  upDateBrand,
  addBrand
} = require("../../modal/brand/index");
//获取商品列表
router.get("/getBrandList", (req, res) => {
  let sql = `select * from t_brand`;
  getBrandList(sql)
    .then((result) => {
      res.json(result);
    })
    .catch((err) => {
      console.log(err);
      res.json({
        code: 501,
        message: "服务端错误",
      });
    });
});

// 删除商品
router.post("/deleteBrand", (req, res) => {
  let { id } = req.body;
  if (!id) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `delete from t_brand where id=?`;
  deleteBrand(sql, [id])
    .then((result) => {
      res.json(result);
    })
    .catch((err) => {
      console.log(err);
      res.json({
        code: 501,
        message: "服务端错误",
      });
    });
});
//更新商品
router.post("/upDateBrand", (req, res) => {
  let { id, name, image } = req.body;
  if (!(id && name && image)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `update t_brand set  name=?, image=? where id=?;`;
  let params = [name, image, id];
  upDateBrand(sql, params)
    .then((result) => {
      res.json(result);
    })
    .catch((err) => {
      console.log(err);
      res.json({
        code: 501,
        message: "服务端错误",
      });
    });
});
//添加商品
router.post("/addBrand", (req, res) => {
  let { name, image } = req.body;
  if (!(name && image)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = "insert into t_brand (name,image) values(?,?)";
  addBrand(sql, [name, image])
    .then((result) => {
      res.json(result);
    })
    .catch((err) => {
      console.log(err);
      res.json({
        code: 501,
        message: "服务端错误",
      });
    });
});

module.exports = router;
