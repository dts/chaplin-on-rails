require 'generators/chaplin/helpers'

module Chaplin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Chaplin::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a Chaplin.js skeleton directory structure and manifest"

      # TODO currently only coffee works
      #class_option :javascript,
                    #type: :boolean,
                    #aliases: "-j",
                    #default: false,
                    #desc: "Generate JavaScript"

      def copy_app_boilerplate
        # it should remove empty directories during 'destroy' command
        %w(controllers lib models views).each do |dir_name|
          empty_directory File.join(javascript_path, dir_name)
        end

        # copy all /javascripts directory
        directory 'javascripts', javascript_path
        directory 'views', rails_view_path
      end

      def generate_app_files
        template "application.js", "#{javascript_path}/application.js"
        template "app_template.js", "#{javascript_path}/#{app_filename}.js"
      end

      def patch_asset_config
        inject_into_file File.join("config","application.rb") , :after => "Rails::Application\n" do
<<-CONFIG
    config.assets.paths << Rails.root.join('app','views')
    config.requirejs.logical_asset_filter = [/\.js$/]
    config.assets.precompile += %w(*.js)
CONFIG
        end
      end

      def apply_requirejs
        # copy config file
        copy_file 'requirejs.yml', 'config/requirejs.yml'

        # check if we can find layout file
        # TODO doesn't work during 'destroy' command
        if layout_path
          gsub_file(layout_path,', "data-turbolinks-track" => true','')
          # inject requirejs tag
          unless gsub_file(layout_path, /javascript_include_tag/, 'requirejs_include_tag')
            display "Can't find a javascript_include_tag in '#{layout_path}'!"
            display "You must add 'requirejs_include_tag' instead of 'javascript_include_tag'"
            display "in your layout(s)."
          end
        else
          display "Can't find a layout to inject requirejs tag!"
          display "You must add 'requirejs_include_tag' instead of 'javascript_include_tag'"
          display "in your layout(s)."
        end
      end


      def post_install_messages
        if File.exists?("#{javascript_path}/application.js")
          display "You have 'application.js' file in your 'assets/' folder."
          display "You should migrate all dependencies to the 'requirejs.yml' config file"
          display "and remove 'application.js file."
        end
      end

    end
  end
end
