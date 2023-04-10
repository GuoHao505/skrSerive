const express = require("express");
const router = express.Router();
const {
  getStoreList,
  deleteStore,
  upDateStore,
  addStore,
} = require("../../modal/store/product");

//获取店铺列表
router.get("/getStoreList", (req, res) => {
  let sql = "select * from t_store ORDER BY create_time DESC";
  getStoreList(sql)
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
// 删除店铺
router.post("/deleteStore", (req, res) => {
  let { id } = req.body;
  if (!id) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `delete from t_store where id=?`;
  deleteStore(sql, [id])
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
//更新店铺信息
router.post("/upDateStore", (req, res) => {
  let { name, address, avatar, tel, region, id } = req.body;
  if (!(name && address && avatar && tel && region && id)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `update t_store set name=?, address=?,avatar=?,tel=?, region=?,last_update_time=? where id=?;`;
  let params = [name, address, avatar, tel, region, Date.now(), id];
  upDateStore(sql, params)
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
//添加店铺
router.post("/addStore", (req, res) => {
  let { name, address, avatar, tel, region, password } = req.body;
  if (!(name && address && avatar && tel && region)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql =
    "insert into t_store (name, address, avatar, tel, region,password,create_time) values(?,?,?,?,?,?,?)";
  addStore(sql, [name, address, avatar, tel, region, password, Date.now()])
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
