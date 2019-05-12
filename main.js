
var http = require('http');
var fs = require('fs');
var url = require('url');
var qs = require('querystring');
var template = require('./lib/template.js');
var path = require('path');
var sanitizeHtml = require('sanitize-html');
var mysql = require('mysql');
var db = require('./lib/db');
var member = require('./lib/member');
var affiliation = require('./lib/affiliation');
var artist = require('./lib/artist');
var lineup = require('./lib/lineup');
var play = require('./lib/play');
var playteam = require('./lib/playteam');
var reservation = require('./lib/reservation');
var showinfo = require('./lib/showinfo');


var app = http.createServer(function(request,response){
    var _url = request.url;
    var queryData = url.parse(_url, true).query;
    var pathname = url.parse(_url, true).pathname;
    if(pathname === '/'){
      if(queryData.id === undefined){
        db.query(`SELECT * FROM topic`, function(error,topics){
          var title = 'Hello DB Term';
          var description = 'Hello.......';
          var html = template.HTML(title,
            `<h2>${title}</h2>${description}`,
          );
          response.writeHead(200);
          response.end(html);
        });/* else {
        topic.page(request, response);
      }*/
    }
  }
    else if(pathname === '/member'){
      member.home(request, response);
    }
    else if(pathname === '/member/create_process'){
      member.create_process(request,response);
    }
    else if(pathname === '/member/update'){
      member.update(request,response);
    }
    else if(pathname === '/member/update_process'){
      member.update_process(request,response);
    }

    else if(pathname === '/affiliation'){
      affiliation.home(request,response);
    }
    else if(pathname === '/artist'){
      artist.home(request,response);
    }
    else if(pathname === '/lineup'){
      lineup.home(request,response);
    }
    else if(pathname === '/play'){
      play.home(request,response);
    }
    else if(pathname === '/playteam'){
      playteam.home(request,response);
    }
    else if(pathname === '/reservation'){
      reservation.home(request,response);
    }
    else if(pathname === '/showinfo'){
      showinfo.home(request,response);
    }
    else{
      response.writeHead(404);
      response.end('Not Found');

    }
  });


app.listen(5658);
