require 'rubygems'
require 'twitter'
require 'rack'
require 'thin'
require './configure'



body = lambda do |env|
  req = Rack::Request.new env
  res = Rack::Response.new

  if req.path_info == '/TwitRake'

end



