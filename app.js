const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
app.use(cors());
const { verify } = require("./utils/token");

// 引入商家的用户路由模块
// const storeUser = require('./controller/store/user');

// 引入商家的商品路由模块
const storeProduct = require("./controller/store/product");

// 引入商品的路由模块
const shop = require("./controller/shop/index");
const brand = require("./controller/brand/index");

// 引入的是评论路由模块
// const rating = require('./controller/rating/rating');

// 引入用户信息的路由模块
const userUser = require("./controller/user/user");
// 引入用户地址的路由模块
// const userAddress=require('./controller/user/address')

// 引入优惠券模块
// const voucher=require('./controller/voucher')

// 引入订单模块
// const order=require("./controller/order")

// 引入快递模块
// const delivery=require("./controller/delivery")
//引入商品的品牌路由模块
// const waresBrand = require('./controller/wares/brand')

//引入商品的菜单路由模块
// const waresMenu = require('./controller/wares/menu')

// 引入会话模块
// const sessionMessage=require('./controller/session/session')

// 引入购物车模块
// const shopCar=require('./controller/shopcar')

// 引入获取分类表模块
// const classification = require('./controller/classification/class')

// 引入商品活动秒杀模块
// const spike = require("./controller/spike/spike")
// const msgSend = require('./controller/msgSend/index')
// const type = require("./controller/type/type")
// const upload = require("./controller/upload/index")

app.use((req, res, next) => {
  let token = req.headers["authorization"];
  if (token) {
    verify(token)
      .then((res) => {
        next();
      })
      .catch((err) => {
        console.log(err.message);
        if (err.message == "invalid token") {
          res.json({
            code: 401,
            message: "无效的token",
          });
          return;
        }
        if (err.message == "jwt expired") {
          res.json({
            code: 401,
            message: "token过期",
          });
        }
      });
    return;
  }
  if (req.url == "/user/login" || req.url == "/user/register") {
    next();
  } else {
    res.json({
      code: 401,
      message: "没有token",
    });
  }
});
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use("/store", storeProduct);
app.use("/shop", shop);
app.use("/brand", brand);
// app.use('/rating', rating)
// app.use('/store',storeUser)
// app.use('/store',sessionMessage)
app.use("/user", userUser);
// // app.use('/user',userAddress)
// app.use('/voucher',voucher)
// app.use('/order',order)
// app.use("/delivery",delivery)
// app.use('/wares',waresBrand)
// app.use('/wares',waresMenu)
// app.use('/shopcar',shopCar)
// app.use('/classification',classification)
// app.use('/spike',spike)
// app.use('/login',msgSend)
// app.use('/type',type)
// app.use('/upload',upload)
app.listen(9528, () => {
  console.log("9528的端口启动了");
});
