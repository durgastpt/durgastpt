const express = require("express");
const app = express();
require("dotenv").config();
app.use(express.json());
app.use(require("cors")());
app.use("/user2", require("./routes/index"));
// const conn = require("../config/DBconnection");

app.get("/", (req, res) => {
    res.json({
        "data": "hello"
    });
});

app.listen(process.env.PORT, () => {
    console.log("running on port=" + process.env.PORT);
});
