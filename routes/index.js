const express = require("express");
const route = express.Router();
const indexservice = require("../services/index");
const bcrypt = require('bcrypt');
const saltRounds = 10;

// var password = "admin";
// var password1 = "admin1";
// bcrypt.genSalt(saltRounds, function(err, salt) {

//     bcrypt.hash(password, salt, function(err, hash) {

//         console.log("hash=",hash);
//         bcrypt.compare(password, hash, function(err, result) {

//           });

//           bcrypt.compare(password1, hash, function(err, result) {
//             if (result) {
//               console.log("It matches!")
//             }
//             else {
//               console.log("Invalid password!");
//             }
//           });
//         });
//     });

route.post("/register", (req, res) => {
  console.log(req.body);
  indexservice.register(req.body).then((data) => {
    console.log("data=", data);
    if (data == "true") {
      res.json({
          "error": "true",
          "message": "email already exists",
          "status":404       
      });
  }
  else{

    res.json({
      "error": "false",
      // "data": data,
      "status": 200,
      "message": "register successfully"
    });
  }
    // res.json({
    //   "error": "true",
    //   "status": 404,
    //   "message": "invalid "
    // });
  })
  // .catch((err) => {
  //   res.json({
  //     "error": "true",
  //     "status": 404,
  //     "message": "something went wrong"
     
  //   });
  // });
  .catch((err) => {
    if (err.errno === 1062) {
        console.log('err: ', err.errno);
        res.json({
            "error": "true",
            "code": err.errno,
            "message": "something went wrong"
            // "status":404       
        });

    }
    else {
        res.json({
            "error": "true",
            "code": err.errno,
            "message": "error"
            // "status":404       
        });
    }

});

});

route.post("/login", (req, res) => {
  // console.log(req.body);

  indexservice.login(req.body).then((data) => {
    console.log("result data=", data);
    const Password = req.body.pwd;
    console.log("Password= ",Password);
    const hash = bcrypt.hashSync(Password, data[0].salt);
    console.log("hash=", ",", hash);
    console.log("db hash=", ",", data[0].pwd);
    
    
    // console.log("res: ",data.body.pwd);
    // console.log("res: ", hash);
    if (data[0].pwd==hash) {
      //  console.log("data: ", data);
      res.json({
        "error": "false",
        "status": 200,
        "message": "login successfully"

      });

    }
    else {

      res.json({
        "error": "true",
        "status": 404,
        "message": "invalid password"
      });
    }

  })
    .catch((err) => {
      console.log(err);
      res.json({
        "error": "true",
        "status": 404,  
      "message": "something went wrong"
     
      });
    });
});


module.exports = route;