const query = require("../db");
//更新商品
const upDateShop = (sql, param) => {
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
//获取商品销量
const getShopListSales = (sql, param) => {
  return new Promise((resolve, reject) => {
    query(sql,param)
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
//获取商品分类
const getShopCategory = (sql) => {
  return new Promise((resolve, reject) => {
    query(sql)
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
//获取商品列表
const getShopList = (sql, { currentPage, pageSize }) => {
  return new Promise((resolve, reject) => {
    query(sql)
      .then((res) => {
        if (res.length > 0) {
          const arr = res.splice(
            currentPage - 1 * pageSize,
            pageSize
          );
          resolve({
            code: 200,
            message: "获取成功",
            data: arr,
            page: {
              total: res.length,
              currentPage: currentPage,
              pageSize: pageSize,
            },
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
//查询商品是否存在
const checkShop = (params) => {
  let sql =
    "select * from t_spu where title=? and brand_id=? and store_id=? and img=? and price=? and param=? and stock=? and special_price=? and create_time=?";
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
//添加商品
const addShop = (sql, params) => {
  return new Promise((resolve, reject) => {
    checkShop(params).then((data) => {
      if (data) {
        resolve({
          code: 402,
          message: "商品已存在",
        });
        return;
      }
    });
    query(sql, params)
      .then((res) => {
        if (res.affectedRows > 0) {
          resolve({
            code: 200,
            message: "添加商品成功",
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
//删除商品
const deleteShop = (sql, param) => {
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

module.exports = {
  getShopList,
  addShop,
  upDateShop,
  deleteShop,
  getShopListSales,
  getShopCategory
};
