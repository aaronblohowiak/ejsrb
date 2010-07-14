#!/usr/bin/env ruby
require 'rubygems'
require 'v8'
require 'yajl'
require 'active_support'

@file_contents_hsh = {}

def assignContentsOfFileToVariable(cxt, variable_name, file_name)
  if (str = @file_contents_hsh[file_name]).blank?
    str = File.read(file_name)
    str = Yajl::Encoder.encode(str)
  end
  cxt.eval("#{variable_name} = " + str)
end

@ejs = File.read("ejs.js")

def ejs_context
  cxt = V8::Context.new
  cxt.eval(@ejs)
  return cxt
end

cxt = ejs_context
assignContentsOfFileToVariable(cxt, "templ", "temlpates/simple.html.ejs")
puts "Simple new context date render:"
puts cxt.eval("new EJS({text: templ, type: '<'}).render()")
3.times{ puts }


json = {
  :key => "value",
  :nested => {
    :twigs => "swirl",
    :eggs => "unhatched",
    :mamma => /tweet/,
    :shouting => [
        "help!",
        "please!",
        "help!"
      ]
  }
}

json = json.to_json
@cxt = ejs_context()
assignContentsOfFileToVariable(@cxt, "templ", "temlpates/hash.html.ejs")
puts "complex new context nested render:"
puts @cxt.eval("new EJS({text: templ, type: '<'}).render(#{json})")
3.times{ puts }


def setup
  @cxt = cxt = V8::Context.new
  cxt.eval(@ejs)
  assignContentsOfFileToVariable(cxt, "templ", "temlpates/hash.html.ejs")
  @cxt.eval("cached = new EJS({text: templ, type: '<'})")
end

def fancy(json)
  val = "cached.render(#{json})"
  @cxt.eval(val)
end

n = 500
puts n.to_s+" Iterations"
Benchmark.bm(20) do |x|
   x.report("new context") { 1.upto(n) do ; cxt = V8::Context.new; end }
   x.report("eval EJS"){ 1.upto(n){ @cxt.eval(@ejs) } }
   x.report("setup template"){ 1.upto(n){ assignContentsOfFileToVariable(@cxt, "templ", "temlpates/hash.html.ejs")} }
   x.report("compile template"){ 1.upto(n){ @cxt.eval("cached = new EJS({text: templ, type: '<'})") }}
   x.report("setup") {  1.upto(n) do ; setup; end}
   x.report("rendering") { for i in 1..n; a = "1"; 
     fancy(json)
  end }
end
