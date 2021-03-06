require 'net/http'
require 'uri'
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
   uri = URI.parse("http://api.nhk.or.jp/v1/pg/list/#{area}/#{service}/#{date}.json?key=" + @url)
   json = Net::HTTP.get(uri)
   result = JSON.parse(json)
   return result
 end

 def genre(area,service,genre,date)
  @url = self.apikey
  uri = URI.parse("http://api.nhk.or.jp/v1/pg/genre/#{area}/#{service}/#{genre}/#{date}.json?key=" + @url)  
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)
  return result
 end

 def info(area,service,id)
  @url = self.apikey
  uri = URI.parse("http://api.nhk.or.jp/v1/pg/info/#{area}/#{service}/#{id}.json?key=" + @url)
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)
  return result
 end

 def now_on_air(area,service)
  @url = self.apikey
  uri = URI.parse("http://api.nhk.or.jp/v1/pg/now/#{area}/#{service}.json?key=" + @url)
  json = Net::HTTP.get(uri)
  result = JSON.parse(json) 
  return result
 end

 attr_writer :key

 def key=(value)
   @key = value
 end 

end

nhk = NHK.new("UqCm6EDFh00qSArYkKw4MQo9XAvPMiHm")

list = nhk.list("130","g1","2014-05-13")

#puts list['list']['g1'][3]['subtitle']

genre = nhk.genre("130","g1","0000","2014-05-13")

#puts genre['list']['g1'][1]['service']['name']

info = nhk.info('130','g1','2014051304965')

#puts info['list']['g1'][0]['area']['name']

now_on_air = nhk.now_on_air('130','g1')

puts now_on_air['nowonair_list']['g1']['previous']['area']['name']















