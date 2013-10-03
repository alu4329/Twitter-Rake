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
          span {
            font-weight: bold;
	    font-family:"Palatino Linotype", "Book Antiqua", Palatino, serif;
	    color: #FF7F24;
          }
          #explain {
            font-size: 0.63em;
          }
        </style>
      </head>
      <body>
        <h1>Práctica 2 SYTW - Víctor Plaza Martín</h1></br>
        <form>
          <p>Nombre del usario/usuarios: <input type="text" name="name"></p>
          <p id=explain>Puedes poner una lista de usuarios separadas por espacios, ejemplo: timoreilly VictorPlazaM</p>
        </form> 
      </body> 
    EOS
    nombre= req.params["name"]

    #Almaceno ese usuario en la variable a_user
    unless nombre.nil? || nombre == 0
      
      array = nombre.split.sort
      
      i = 0
      num = array.size

      while i < num  do 
	a_user = Twitter.user(array[i])
      
	tweet = Twitter.user_timeline(a_user).first
      
	if tweet
	  res.write <<-"EOS"
	    </br></br>
	    <p><span>Usuario: </span> #{array[i]}</p>     
	    <p><span>Último Tweet: </span> #{tweet.text}</p>
	    <p><span>Fecha del Tweet: </span> #{tweet.created_at}</P>
	    <p><span>Identificador del Tweet: </span> #{tweet.id}</p>    
	  EOS
	end
	i +=1
      end
    end
  else
    res.write <<-"EOS"
      <p>Escriba bien la url</p>
    EOS
  end
  res.finish
end



Rack::Handler::Thin.run app, :Port=>9300
