const conn = require("../config/DBconnection");
const bcrypt = require('bcrypt');
const saltRounds = 10;

class indexService {


    register(data) {
        // console.log(data);

        let p = new Promise((resolve, reject) => {

         const Password = data.pwd;
            console.log("Password= ",Password);
            const salt = bcrypt.genSaltSync(saltRounds);
            console.log("salt=",salt);
            // const hash = bcrypt.hashSync(Password, salt);
            const hash = bcrypt.hashSync(Password, salt);
            console.log("hash=", ",", hash);
            conn.getConnection((err, connection) => {
                connection.query("insert into user2 (email,pwd,salt,role,status) values (?,?,?,0,1)", [ data.email,hash,salt], (err, result) => {
                    connection.release();
                    console.log("error=", err);
                    if (err) {
                        reject(err);
                    }
                    else {
                        resolve(result);
                    }
                });
            });

        })
        return p;
    }

    login(Data) {
        let p = new Promise((resolve, reject) => {
            
            
            // console.log(Data);
            conn.getConnection((err,connection)=>{

                connection.query("select * from user2 where email='" + Data.email + "'", (err, result) => {
                    connection.release();
            //         const Password = Data.pwd;
            // console.log("Password= ",Password);
            // const hash = bcrypt.hashSync(Password, saltRounds);
            // console.log("hash=", ",", hash);
                    // console.log(result);
                    if (err) reject(err);
                    else resolve(result);
                });
            })

        });
        return p;
    }


}
module.exports = new indexService();