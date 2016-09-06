module.exports = function (content, bucket, callback) {
//    var reg = /(\/uploads\/)(\w+\/)((.*?)\.(jpg|png)+)/g;
    //考虑后期严格匹配
    var reg = /(\/uploads\/)(files\/)((.*?)\.(jpg|png)+)/g;
    var bucket_url = "https://s3-us-west-2.amazonaws.com/" + bucket;
    var matches = content.match(reg);
    console.log(matches);
    if(matches!==null){
        for (var i = 0; i < matches.length; i++) {
            var current_match = matches[i].match(reg);
            var replacestr = bucket_url + RegExp.$1 + RegExp.$2 + RegExp.$3;
            if (current_match.length > 0) {
                for (var k = 0; current_match[k]; k++) {
                    var result = current_match[k].replace(reg, replacestr);
                    content = (content.replace(current_match[k], result));
                }
            }
        }
    }else{
        callback(null);
    }

    callback(content);
}