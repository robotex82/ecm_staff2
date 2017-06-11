class Ecm::Staff::Person < Ecm::Staff::Base
  # associations
  has_many :person_positions, ->() { order(begin_at: :desc) },
           class_name: 'Ecm::Staff::PersonPosition',
           inverse_of: :person
  accepts_nested_attributes_for :person_positions, allow_destroy: true

  has_many :positions, through: :person_positions,
                       class_name: 'Ecm::Staff::Position'

  has_many :attached_pictures, as: :pictureable,
                               class_name: 'Ecm::Pictures::AttachedPicture',
                               inverse_of: :pictureable
  has_many :pictures, through: :attached_pictures,
                      class_name: 'Ecm::Pictures::Picture'

  accepts_nested_attributes_for :attached_pictures, allow_destroy: true
  accepts_nested_attributes_for :pictures, allow_destroy: true

  # acts as list
  acts_as_list
  # default_scope order: 'position ASC'

  translates :description, :prefix, :slug if ActiveRecord::Base.table_exists?(:ecm_staff_person_translations)

  # callbacks
  after_initialize :set_defaults, if: :new_record?

  # friendly id support
  extend FriendlyId
  friendly_id :fullname, use: [:slugged, :finders]

  # markup support
  acts_as_markup language: :variable,
                 columns: [:description]

  # validations
  validates :markup_language, presence: true,
                              inclusion: Ecm::Staff::Configuration.markup_languages.map(&:to_s)
  validates :firstname, presence: true
  validates :lastname,  presence: true

  def age
    return if birthdate.nil?
    if (Time.zone.now.month < birthdate.month) || (Time.zone.now.month == birthdate.month && birthdate.day >= Time.zone.now.day)
      Time.zone.now.year - birthdate.year - 1
    else
      Time.zone.now.year - birthdate.year
    end
  end # def

  def fullname
    "#{firstname} #{lastname}"
  end # def

  def fullname_with_prefix
    prefix.present? ? "#{prefix} #{fullname}" : fullname
  end # def

  def preview_picture
    pictures.first
  end # def

  def preview_picture_image_url(style = nil)
    preview_picture.image.url(style) if preview_picture.respond_to?(:image) && preview_picture.image.respond_to?(:url)
  end # def

  def to_s
    fullname
  end # def

  private

  def set_defaults
    self.markup_language ||= Ecm::Staff::Configuration.default_markup_language
  end
end
