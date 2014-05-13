require 'json'

class NHK

 def initialize(args = "hoge")
  @key = args
 end

 def show
  print "Apikey is ,@key,\n"
 end
  
 attr_reader :apikey

 def apikey 
  return @key
 end

 def url
  "http://nhk.jp" + @key
 end

 def list(area,service,date)
   @url = self.apikey
   JSON.parse("http://api.nhk.or.jp/v1/pg/list/#{area}/#{service}/#{date}.json?key=" + @url)
 end

 attr_writer :key

 def key=(value)
   @key = value
 end 

end

nhk = NHK.new("UqCm6EDFh00qSArYkKw4MQo9XAvPMiHm")

p nhk.list("130","g1","2014-05-13")















