class Ecm::Staff::Organisation < Ecm::Staff::Base
  # associations
  has_many :business_units

  # callbacks
  after_initialize :set_defaults, if: :new_record?

  translates :description, :name, :slug if respond_to?(:translates)

  # friendly id support
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  # markup support
  acts_as_markup language: :variable,
                 columns: [:description]

  # validations
  validates :markup_language, inclusion: Ecm::Staff::Configuration.markup_languages.map(&:to_s)
  validates :name, presence: true,
                   uniqueness: true

  def to_s
    name
  end

  private

  def set_defaults
    self.markup_language ||= Ecm::Staff::Configuration.default_markup_language
  end
end
