const query = require("../db");
//店铺列表
const getStoreList = (sql, param) => {
  return new Promise((resolve, reject) => {
    query(sql, param)
      .then((res) => {
        if (res.length > 0) {
          resolve({
            code: 200,
            message: "获取成功",
            data: res,
          });
          return;
        }
        resolve({
          code: 402,
          message: "获取失败",
        });
      })
      .catch((err) => {
        reject(err);
      });
  });
};
//删除店铺
const deleteStore = (sql, param) => {
  return new Promise((resolve, reject) => {
    query(sql, param)
      .then((res) => {
        console.log(res);
        if (res.affectedRows > 0) {
          resolve({
            code: 200,
            message: "删除成功",
          });
          return;
        }
        resolve({
          code: 402,
          message: "删除失败",
        });
      })
      .catch((err) => {
        reject(err);
      });
  });
};
//更新店铺信息
const upDateStore = (sql, param) => {
  return new Promise((resolve, reject) => {
    query(sql, param)
      .then((res) => {
        if (res.affectedRows > 0) {
          resolve({
            code: 200,
            message: "更新成功",
          });
          return;
        }
        resolve({
          code: 402,
          message: "更新失败",
        });
      })
      .catch((err) => {
        reject(err);
      });
  });
};
//查询店铺是否存在
const checkStore = (params) => {
  let sql =
    "select * from t_store where name=?";
  return new Promise((resolve, reject) => {
    query(sql, params)
      .then((res) => {
        if (res?.length > 0) {
          resolve(true);
          return;
        }
        resolve(false);
      })
      .catch((err) => {
        reject(err);
      });
  });
};
//添加店铺
const addStore = (sql, params) => {
  return new Promise((resolve, reject) => {
    checkStore(params[0]).then((data) => {
      if (data) {
        resolve({
          code: 402,
          message: "店铺已存在",
        });
        return;
      }
    });
    query(sql, params)
      .then((res) => {
        if (res.affectedRows > 0) {
          resolve({
            code: 200,
            message: "添加店铺成功",
          });
          return;
        }
        resolve({
          code: 502,
          message: "添加失败",
        });
      })
      .catch((err) => {
        reject(err);
      })
      .catch((err) => {
        reject(err);
      });
  });
};

module.exports = {
  addStore,
  upDateStore,
  deleteStore,
  getStoreList,
};
