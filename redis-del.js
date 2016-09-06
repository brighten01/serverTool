var redis =require("redis");
var  options = {
    host:"127.0.0.1",
    port:6379
};

var client = redis.createClient(options);
client.keys('sess*',function(err,object){
     for(var i=0 ;i<object.length;i++){
        client.del(object[i],function (err,data){
            if(err){
                console.log(err);
            }
            console.log(data);
        })
    }
});