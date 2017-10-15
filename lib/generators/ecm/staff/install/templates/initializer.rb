Ecm::Staff.configure do |config|
  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ markdown rdoc textile ]
  # 
  config.markup_languages = %w( markdown rdoc textile )

  # Default markup language
  #
  # default: config.default_markup_language = 'textile'
  # 
  config.default_markup_language = 'textile'

  # Person model
  #
  # default: config.person_class_name = 'Person'
  # 
  config.person_class_name = 'Person'

  # Set the base controller for the contact form
  #
  # Default: config.base_controller = 'ApplicationController'
  #
  config.base_controller = 'ApplicationController'

  # Paperclip style to use for the preview picture image.
  #
  # Default: config.preview_picture_image_style = :default_thumb
  #
  config.preview_picture_image_style = :default_thumb
end
