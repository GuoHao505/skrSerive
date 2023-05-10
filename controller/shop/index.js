const express = require("express");
const router = express.Router();
const {
  getShopList,
  addShop,
  upDateShop,
  deleteShop,
  getShopTotal,
  getShopCategory,
  getChartsList,
  getSalesRanking,
  getSalesProportion,
  getPaysChartsList,
} = require("../../modal/shop/index");

//
router.post("/getPaysChartsList", (res) => {
  getPaysChartsList(sql)
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
//
router.post("/getSalesProportion", (req,res) => {
  let sql = `SELECT title as name,SUM(sales) as value  FROM t_spu GROUP BY spg_id`;
  getSalesProportion(sql)
    .then((result) => {
      console.log(res);
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
//获取排名前7
router.post("/getRanking", (req, res) => {
  let sql = `SELECT title FROM t_spu order by sales desc limit 7`;
  getSalesRanking(sql)
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
//
router.post("/getChartsList", (req, res) => {
  let sql = `SELECT date_format(create_time, '%Y-%m') create_time,SUM(sales) as sales,SUM(views) as views,SUM(pays) as pays,SUM(stocks) as stocks FROM t_spu GROUP BY	date_format(create_time, '%Y-%m')`;
  getChartsList(sql)
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
//获取商品列表
router.post("/getShopList", (req, res) => {
  const { currentPage, pageSize } = req.body;
  let sql = `select * from t_spu`;
  getShopList(sql, { currentPage, pageSize })
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
//获取商品
router.post("/getShopTotal", (req, res) => {
  let sql = `select SUM(sales) as salesTotal,SUM(pays) as paysTotal,SUM(views) as viewsTotal,SUM(stocks) as stocksTotal from t_spu `;
  getShopTotal(sql)
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
//获取商品分类
router.get("/getShopCategory", (req, res) => {
  let sql = `select id,name from t_category ORDER BY id `;
  getShopCategory(sql)
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
