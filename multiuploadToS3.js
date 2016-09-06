/**
 * nodejs uploadfile 文件批量上传程序
 * 用法：npm install aws-sdk && npm install mime
 * author  gaohui
 * @copyright  stone
 * @lincense  http://forum.supersu.com/licence
 * @lastupdate  gaohui
 */
var AWS = require("aws-sdk");
var settings = require("./settings");
var fs = require("fs");
var path = require("path");
var mime = require("mime");
var uploadfileDir = settings.uploadDir;
var imgpath = path.join(__dirname, uploadfileDir);

var s3 = new AWS.S3(settings);
fs.readdir(imgpath, function (err, dirs) {
    dirs.forEach(function (item) {
        var parent_dir = item;
        var current_dir = path.join(imgpath, item);

        fs.readdir(path.join(imgpath, item), function (err, files) {
            files.forEach(function (item) {
                var current_file = path.join(current_dir + "/" + item);
                fs.readFile(current_file, function (err, buffer) {
                    var params = {
                        Bucket: "nodebb-test-upload",
                        ACL: "public-read",
                        Key: "uploads/" + parent_dir + "/" + path.basename(current_file),
                        Body: buffer,
                        ContentLength: buffer.length,
                        ContentType: mime.lookup(current_file)
                    };
                    s3.putObject(params, function (err, data) {
                        if (err) {
                            console.log(err);
                        }
                        console.log(params.Key + " has been upload to amazon s3 server");
                    });
                });
            });
        });
    });
});