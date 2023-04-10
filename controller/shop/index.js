const express = require("express");
const router = express.Router();
const {
  getShopList,
  addShop,
  upDateShop,
  deleteShop,
} = require("../../modal/shop/index");
//获取商品列表
router.post("/getShopList", (req, res) => {
  const { currentPage, pageSize } = req.body;
  let sql = `select * from t_spu ORDER BY create_time DESC`;
  getShopList(sql,{ currentPage, pageSize })
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
router.post("/deleteShop", (req, res) => {
  let { id } = req.body;
  if (!id) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `delete from t_spu where id=?`;
  deleteShop(sql, [id])
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
router.post("/upDateShop", (req, res) => {
  let {
    title,
    brand_id,
    store_id,
    img,
    price,
    param,
    stock,
    special_price,
    id,
  } = req.body;
  price = parseFloat(price).toFixed(2);
  if (
    !(
      title &&
      brand_id &&
      store_id &&
      img &&
      price &&
      param &&
      stock &&
      special_price &&
      id
    )
  ) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `update t_spu set  title=?, brand_id=?,store_id=?,img=?, price=?, param=?, stock=?, special_price=?,last_update_time=? where id=?;`;
  let params = [
    title,
    brand_id,
    store_id,
    img,
    price,
    param,
    stock,
    special_price,
    Date.now(),
    id,
  ];
  upDateShop(sql, params)
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
router.post("/addShop", (req, res) => {
  let { title, brand_id, store_id, img, price, param, stock, special_price } =
    req.body;
  if (!(title && img && price && param && stock && special_price)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql =
    "insert into t_spu (title, brand_id,store_id, img, price, param, stock, special_price,create_time) values(?,?,?,?,?,?,?,?,?)";
  addShop(sql, [
    title,
    brand_id,
    store_id,
    img,
    price,
    param,
    stock,
    special_price,
    Date.now(),
  ])
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
