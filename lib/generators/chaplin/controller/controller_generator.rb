require 'generators/chaplin/helpers'

module Chaplin
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      include Chaplin::Generators::Helpers
      
      source_root File.expand_path("../templates",__FILE__)

      desc "Generates a Chaplin.js controller"

      def generate_js_and_template
        template "controller_template.js", "#{javascript_path}/controllers/#{file_name}-controller.js"
      end
    end
  end
end
