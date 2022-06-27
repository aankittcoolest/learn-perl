var FormData = require("form-data");
var fetch = require("node-fetch");
var fs = require("fs");
const { exit } = require("process");

var form = new FormData();
form.append("hello", "world");
form.append("merchant_id", 100);
form.append("merchant_logo", fs.createReadStream("cat.png"));

fetch("http://old.trafficgate.net:8080/api/merchant.cgi", { method: "POST", body: form })
  .then(function (res) {
    return res.json();
  })
  .then(function (json) {
    console.log(json);
  });

// form.submit("http://localhost:80/post.cgi", function (err, res) {
//   console.log(res);
//   res.resume();
// });
