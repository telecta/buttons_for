module ButtonsFor
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Copy ButtonsFor translations"
      source_root File.expand_path("../templates", __FILE__)

      def copy_translations
        copy_file "buttons_for.en.yml", "config/locales/buttons_for.en.yml"
      end

    end
  end
end
