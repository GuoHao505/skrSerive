const express = require("express");
const router = express.Router();
const { sendMessage, RndNum } = require("../../utils/message.js");
const {
  register,
  login,
  changePassword,
  updateUserInfo,
  getUserInfo,
  deleteUserInfo,
  addUserInfo,
} = require("../../modal/user/user");
const { send } = require("process");
let temp;

//时间戳转换为日期
const timestampToTime = (timestamp) => {
  timestamp = timestamp ? timestamp : null;
  let date = new Date(timestamp);
  let Y = date.getFullYear() + "-";
  let M =
    (date.getMonth() + 1 < 10
      ? "0" + (date.getMonth() + 1)
      : date.getMonth() + 1) + "-";
  let D = (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) + " ";
  let h =
    (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) + ":";
  let m =
    (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) +
    ":";
  let s = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
  return Y + M + D + h + m + s;
};

router.post("/getMessage", (req, res) => {
  const VerificationCode = RndNum(6);
  temp = VerificationCode;
  setTimeout(() => {
    temp = "";
  }, 60000);
  const { phoneNum } = req.body;
  sendMessage(phoneNum, VerificationCode).then((result) => {
    res.json({
      code: "200",
      data: {
        Code: result,
      },
    });
    return;
  });
});
// 用户注册
router.post("/register", (req, res) => {
  let { username, password, email } = req.body;
  // if (VerificationCode != temp) {
  //   res.json({
  //     code: 403,
  //     message: "验证码输入错误!",
  //   });
  // }
  if (!(username && password && email)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `insert into t_customer (username,nickname,password,email,create_time) value (?,?,?,?,?)`;
  register(sql, [username, Date.now(), password, email, timestampToTime(Date.now())])
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res.json({
        code: 501,
        message: "服务器错误",
        err,
      });
    });
});

// 用户登录
router.post("/login", (req, res) => {
  let { username, password } = req.body;
  if (!(username && password)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `select * from t_customer where username=? and password=?`;
  login(sql, [username, password])
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res.json({
        code: 501,
        message: "服务器错误",
      });
    });
});

// 用户修改密码
router.post("/changePassword", (req, res) => {
  let { username, password } = req.body;
  if (!(username && password)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `update t_customer set password=?,last_update_time=? where username=?`;
  changePassword(sql, [password,timestampToTime(Date.now()), username])
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      console.log(err);
      res.json({
        code: 501,
        message: "服务器错误",
      });
    });
});

// 修改个人信息
router.post("/updateUserInfo", (req, res) => {
  let { id, avatar, username, email, tel, nickname } = req.body;
  if (!(username && email && tel && avatar && nickname)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql =
    "update t_customer set avatar=?,username=?,email=?,tel=?,nickname=?,last_update_time=? where id=?";
  updateUserInfo(sql, [
    avatar,
    username,
    email,
    tel,
    nickname,
    timestampToTime(Date.now()),
    id,
  ])
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      console.log(err);
      res.json({
        code: 501,
        message: "服务器错误",
      });
    });
});

//获取所有用户信息
router.get("/getUserInfo", (req, res) => {
  let sql = `select id,username,password,email,tel,create_time,last_update_time,nickname,avatar,role from t_customer ORDER BY create_time DESC`;
  getUserInfo(sql)
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      console.log(err);
      res.json({
        code: 501,
        message: "服务器错误",
      });
    });
});
//删除账号
router.post("/deleteUserInfo", (req, res) => {
  let { id } = req.body;
  if (!id) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `delete from t_customer where id=?`;
  deleteUserInfo(sql, [id])
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      console.log(err);
      res.json({
        code: 501,
        message: "服务器错误",
      });
    });
});

//添加账号
router.post("/addUserInfo", (req, res) => {
  let { username, password, nickname, avatar, email, tel } = req.body;
  if (!(username && avatar && tel && email && password)) {
    res.json({
      code: 403,
      message: "入参不符",
    });
    return;
  }
  let sql = `insert into t_customer (username,password,nickname,avatar,email,tel,create_time) value (?,?,?,?,?,?,?)`;
  addUserInfo(sql, [
    username,
    password,
    nickname,
    avatar,
    email,
    tel,
    timestampToTime(Date.now()),
  ])
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res.json({
        code: 501,
        message: "服务器错误",
        err,
      });
    });
});

module.exports = router;
