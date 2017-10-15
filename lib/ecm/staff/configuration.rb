module Ecm
  module Staff
    module Configuration
      def configure
        yield self
      end

      mattr_accessor(:default_markup_language) { :textile }
      mattr_accessor(:markup_languages) { [:textile] }
      mattr_accessor(:person_class_name) { 'Person' }
      mattr_accessor(:base_controller) { '::ApplicationController' }
      mattr_accessor(:preview_picture_image_style) { :default_thumb }
    end
  end
end
