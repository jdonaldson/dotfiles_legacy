#!/usr/bin/env ruby
# jsonhxdef: Turns some well-specified json into a haxe typedef
# Author: Justin Donaldson jdonaldson@gmail.com
#
# Usage: ./jsonhxdef.rb input.json
# (output is written to stdout)

require 'rubygems'
require 'json'

def hash_equal(h1,h2)
  return false if h1.length != h2.length
  h1.each{|key,value|
    return false if not h2.key?(key)
    return false if h1[key] != h2[key]
  }
  return true
end


file_name = ARGV[0]
raise "No file argument" if File.name.nil?
raise "File does not exist" if not File.exists?(file_name)
str = IO.read(file_name)
json = JSON.parse(str)
objs = {}
unique_objs = {}
objs['JsonHxDef'] = json
while(not objs.empty?)
  obkey = objs.keys[0]
  obj = objs[obkey]

  fobj = {}
  obj.each{|key,value|  
    type = ''
    arr_depth = 0
    if value.is_a? Array
      while value.is_a? Array
        value = value[0]
        arr_depth +=1
        type = key.split(/[^a-zA-Z]/).map{|x| x.capitalize}.join("")
		p type
      end
      if value.class == Hash
        objs[type] = value
		if arr_depth > 0
		  type = "Array" + ("<" * arr_depth) + type + (">" * arr_depth)
		end
        fobj[key] = type
        next
      end
    end

    if value.is_a? Float
    	type = "Float"
    elsif value.is_a? Integer
    	type = "Int"
    elsif value.is_a?(TrueClass) || value.is_a?(FalseClass)
    	type = "Bool"
    elsif value.is_a? String
    	type = "String" 
    elsif value.is_a? Hash
      type = key.split(/[^a-zA-Z]/).map{|x| x.capitalize}.join("")
      objs[type] = value
    end 

	if arr_depth > 0
	  type = "Array" + ("<" * arr_depth) + type + (">" * arr_depth)
	end

    fobj[key] = type
  }
  objs.delete(obkey)
  
  while(unique_objs.key?(obkey))
    obkey +='X'
  end
  unique_objs[obkey]=true
    
  print "\ntypedef " + obkey + " = {\n"
  fobj.each{|key,value|
    print "\t" + key + ":" + value + ",\n"
  }
  print "}\n"
  
end
