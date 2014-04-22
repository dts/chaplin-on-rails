require 'generators/chaplin/helpers'

module Chaplin
  module Generators
    class LayoutGenerator < Rails::Generators::NamedBase
      include Chaplin::Generators::Helpers
      
      source_root File.expand_path("../templates",__FILE__)

      desc "Generates a Chaplin.js layout"

      def generate_js_and_template
        template "view_template.js", "#{javascript_path}/views/layouts/#{file_path}_view.js"
        template "template_template.jst.ejs", "#{template_path}/layouts/#{file_path}.jst.ejs"
      end
    end
  end
end
