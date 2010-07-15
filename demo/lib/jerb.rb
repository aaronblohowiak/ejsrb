require 'v8'
require 'yajl'

module Jerb
  CONTEXT = V8::Context.new
  CONTEXT.load(File.dirname(__FILE__)+'/jerb/jerb.js')
  class Render
    def initialize(template, options)
      @template = template
      @options = options
    end
    
    # def render(scope = Object.new, locals = {}, &block)
    #   #puts scope.inspect
    #   #template = Yajl::Encoder.encode(@template)
    #   #CONTEXT.eval('new JERB(#{template}).render(#{data.to_json})')
    # end
    
    def compile(template)
      # Template has a generic identifier in Rails >=3.0.0
      # template.filename
    end
    
    def self.call(template)
      puts template.inspect
      source = Yajl::Encoder.encode(template.source)
      data = template.instance_variable_get(:@data)
      code = "data= @template.instance_variable_get(:@data).to_json; puts data.inspect; Jerb::CONTEXT.eval('new JERB(#{source}).render('+data+');')"
      puts code
      code
    end
    
    # def self.call(template)
    #   "#{name}.new(self, {}).render(template, local_assigns)"
    # end
  end
end

Jerb::Render
ActiveRecord::Base.include_root_in_json = false
ActiveRecord::Base.include_root_in_json = false
ActiveRecord::Base.include_root_in_json = false
ActiveRecord::Base.include_root_in_json = false
ActiveRecord::Base.include_root_in_json = false
ActiveRecord::Base.include_root_in_json = false
ActiveRecord::Base.include_root_in_json = false
ActiveRecord::Base.include_root_in_json = false
ActiveRecord::Base.include_root_in_json = false

ActionView::Template.register_template_handler(:jerb, Jerb::Render)
