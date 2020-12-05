// TODO checkServerIdentity
// https://nodejs.org/api/https.html#https_https_request_options_callback

const https = require('https');

// '/user/repos'
// '/users/Jakkins/repos'
const options = {
    host: 'api.github.com',
    port: 443,
    path: '/user/repos',
    headers: {
        'User-Agent': 'curl/7.72.0',
        'Accept': '*/*',
        'Authorization': 'token cdefvervfqwblablablabla'
    },
};

console.log('> Sending Request');
const req = https.request(options, (res) => {
    // console.log('statusCode:', res.statusCode);
    // console.log('headers:', res.headers);
    let data = '';
    res.on('data', (d) => {
        data += d;
    });

    res.on('end', () => {
        let json = JSON.parse(data);
        //console.log(JSON.stringify(json, null, 2));
        json.forEach(element => {
            console.log("\t" + element.name);
        });
    });
});
  
req.on('error', (e) => {
    console.error(e);
});
req.end();


//XMLHttpRequest is a built-in object in web browsers.
// let XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

/*
    NOT deprecated
    curl -H "Authorization: token cdefvervfqwblablablabla" https://api.github.com

    DEPRECATED username:password
    curl -u Jakkins:cdefvervfqwblablablabla https://api.github.com/user
    curl -u Jakkins:cdefvervfqwblablablabla https://api.github.com/user/repos
*/