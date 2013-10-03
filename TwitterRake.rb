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
      <p>Ha accedido correctamente a su página web</p>
    EOS
  else
    res.write <<-"EOS"
      <p>Escriba bien la url</p>
    EOS
  end
  res.finish
end



Rack::Handler::Thin.run app, :Port=>9297
