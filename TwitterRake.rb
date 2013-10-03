require 'rubygems'
require 'twitter'
require './configure'
require 'rack'
require 'thin'




app = lambda do |env|

  req = Rack::Request.new env
  res = Rack::Response.new

  #Comprobar que el pathinfo de la url es el correcto
  if req.path_info == '/TwitRake'
    res.write <<-"EOS"
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title> TwitRack </title>
        <style type="text/css">
          body {
            background-image: url(http://img24.imageshack.us/img24/5495/wallp.jpg);
	    text-align: center;
          }
          h1 {color:white;}
          p {color:white;}
        </style>
      </head>
      <body>
        <h1>Práctica 2 SYTW - Víctor Plaza Martín</h1>
        <form>
          <p>Nombre del usario: <input type="text" name="name"></p><br>
        </form> 
      </body> 
    EOS
    nombre= req.params["name"]
    res.write <<-"EOS"
      <p>El nombre es #{nombre}</p>
    EOS
  else
    res.write <<-"EOS"
      <p>Escriba bien la url</p>
    EOS
  end
  res.finish
end



Rack::Handler::Thin.run app, :Port=>9297
