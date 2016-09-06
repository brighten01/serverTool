var redis = require("redis");
var client = redis.createClient();
var match = require("./match");
var settings = require("./settings");
client.keys("post:*", function (err, keylist) {
    keylist.forEach(function (item) {

        client.hget(item, "content", function (err, post) {
            match(post, settings.bucket, function (result) {
                if (result !== false && result!=null) {
                    client.hset(item, "content", result);
                }
                console.log("keys" + item + "chagnge complete \n");
            })
        });
    });
});