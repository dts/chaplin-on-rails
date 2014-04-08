require 'generators/chaplin/helpers'

module Chaplin
  module Generators
    class LayoutGenerator < Rails::Generators::NamedBase
      include Chaplin::Generators::Helpers
      
      source_root File.expand_path("../templates",__FILE__)

      desc "Generates a Chaplin.js layout"

      def generate_js_and_template
        template "view_template.js", "#{javascript_path}/views/layouts/#{file_name}.js"
        template "template_template.hbs", "#{javascript_path}/templates/layouts/#{file_name}.hbs"
      end
    end
  end
end
