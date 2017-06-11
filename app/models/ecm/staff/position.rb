class Ecm::Staff::Position < Ecm::Staff::Base
  # associations
  has_many :person_positions, dependent: :restrict_with_error
  has_many :people, through: :person_positions,
                    class_name: Ecm::Staff::Configuration.person_class_name

  # callbacks
  after_initialize :set_defaults, if: :new_record?

  # friendly id support
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  translates :description, :name, :slug if ActiveRecord::Base.table_exists?(:ecm_staff_position_translations)

  # markup support
  acts_as_markup language: :variable,
                 columns: [:description]

  # nested set support
  acts_as_nested_set

  # validations
  validates :name, presence: true,
                   uniqueness: true

  def people_count
    people.count
  end

  def to_s
    name
  end

  private

  def set_defaults
    self.markup_language ||= Ecm::Staff::Configuration.default_markup_language
  end
end
