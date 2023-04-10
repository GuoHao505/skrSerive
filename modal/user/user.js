const query = require("../db");
const { getToken } = require("../../utils/token");
// 用于检测用户注册时用户名是否已经存在
const checkRegister = (param) => {
  let sql = "select id from t_customer where username=?";
  return new Promise((resolve, reject) => {
    query(sql, param)
      .then((res) => {
        if (res.length > 0) {
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

//注册
const register = (sql, param) => {
  return new Promise((resolve, reject) => {
    checkRegister(param[0])
      .then((data) => {
        if (data) {
          resolve({
            code: 402,
            message: "用户名已存在",
          });
          return;
        }
        query(sql, param)
          .then((res) => {
            if (res.affectedRows > 0) {
              resolve({
                code: 200,
                message: "注册成功",
              });
              return;
            }
            resolve({
              code: 502,
              message: "注册失败",
            });
          })
          .catch((err) => {
            reject(err);
          });
      })
      .catch((err) => {
        reject(err);
      });
  });
};
//添加用户
const addUserInfo = (sql, param) => {
  return new Promise((resolve, reject) => {
    checkRegister(param[0])
      .then((data) => {
        if (data) {
          resolve({
            code: 402,
            message: "账号已存在",
          });
          return;
        }
        query(sql, param)
          .then((res) => {
            console.log(res);
            if (res.affectedRows > 0) {
              resolve({
                code: 200,
                message: "添加成功",
              });
              return;
            }
            resolve({
              code: 502,
              message: "添加失败",
            });
          })
          .catch((err) => {
            console.log(err);
            reject(err);
          });
      })
      .catch((err) => {
        reject(err);
      });
  });
};
// 登录
const login = (sql, param) => {
  return new Promise((resolve, reject) => {
    query(sql, param)
      .then((res) => {
        console.log(res);
        if (res.length > 0) {
          let {
            id,
            username,
            email,
            tel,
            create_time,
            last_update_time,
            nickname,
            avatar,
            role,
          } = res[0];
          let userInfo = {
            id,
            username,
            email,
            tel,
            create_time,
            last_update_time,
            nickname,
            avatar,
            role,
          };
          resolve({
            code: 200,
            message: "登录成功",
            data: { userInfo: userInfo, token: getToken(userInfo) },
          });
          return;
        }
        resolve({
          code: 402,
          message: "登录失败",
        });
      })
      .catch((err) => {
        reject(err);
      });
  });
};

// 用于用户修改密码
const changePassword = (sql, param) => {
  return new Promise((resolve, reject) => {
    checkRegister(param[1]).then((res) => {
      if (!res) {
        resolve({
          code: 402,
          message: "用户名不存在",
        });
        return;
      }
      query(sql, param)
        .then((res) => {
          if (res.affectedRows > 0) {
            resolve({
              code: 200,
              message: "修改密码成功",
            });
            return;
          }
          resolve({
            code: 402,
            message: "修改密码失败",
          });
        })
        .catch((err) => {
          reject(err);
        });
    });
  });
};

// 用于用户修改个人信息
const updateUserInfo = (sql, param) => {
  return new Promise((resolve, reject) => {
    query(sql, param)
      .then((res) => {
        console.log(res, "----");
        if (res.affectedRows > 0) {
          resolve({
            code: 200,
            message: "修改信息成功",
          });
          return;
        }
        resolve({
          code: 402,
          message: "修改信息失败",
        });
      })
      .catch((err) => {
        reject(err);
      });
    // })
  });
};
//获取用户信息
const getUserInfo = (sql, param) => {
  return new Promise((resolve, reject) => {
    query(sql, param)
      .then((res) => {
        if (res.length > 0) {
          resolve({
            code: 200,
            data: res,
          });
          return;
        }
        resolve({
          code: 402,
          message: "获取用户信息失败",
        });
      })
      .catch((err) => {
        reject(err);
      });
    // })
  });
};

//删除用户
const deleteUserInfo = (sql, param) => {
  return new Promise((resolve, reject) => {
    query(sql, param)
      .then((res) => {
        if (res.affectedRows > 0) {
          resolve({
            code: 200,
            message: "删除用户成功",
          });
          return;
        }
        resolve({
          code: "402",
          message: "删除用户失败",
        });
      })
      .catch((err) => {
        reject(err);
      });
  });
};

module.exports = {
  register,
  login,
  changePassword,
  updateUserInfo,
  getUserInfo,
  deleteUserInfo,
  addUserInfo,
};
