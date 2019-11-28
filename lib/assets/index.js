var fs = require('fs');

let f = fs.readFile("./suggest.json", "utf-8", function (err, data) {
    data = data.replace(/\&\#10\;/igm, '')
    fs.writeFile('suggest_chinese.json', reconvert(data), 'utf-8', function (err) {
        if (err) { res.status(500).send('Server is error...') }
    })
})

function reconvert(str) {
    str = str.replace(/(\\u)(\w{1,4})/gi, function ($0) {
        return (String.fromCharCode(parseInt((escape($0).replace(/(%5Cu)(\w{1,4})/g, "$2")), 16)));
    });
    str = str.replace(/(&#x)(\w{1,4});/gi, function ($0) {
        return String.fromCharCode(parseInt(escape($0).replace(/(%26%23x)(\w{1,4})(%3B)/g, "$2"), 16));
    });
    str = str.replace(/(&#)(\d{1,6});/gi, function ($0) {
        return String.fromCharCode(parseInt(escape($0).replace(/(%26%23)(\d{1,6})(%3B)/g, "$2")));
    });
    return str;
} 