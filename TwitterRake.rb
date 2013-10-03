app = lambda do |env|

  req = Rack::Request.new env
  res = Rack::Response.new

  #Comprobar que el pathinfo de la url es el correcto
  if req.path_info == '/TwitRake'
    res.write <<-"EOS"
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title> TwitRack </title>
      </head>
      <body>
        <form>
          Nombre del usario: <input type="text" name="name"><br>
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
