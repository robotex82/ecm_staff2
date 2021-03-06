class Ecm::Staff::BusinessUnit < Ecm::Staff::Base
  # associations
  belongs_to :organisation
  has_many :person_positions, dependent: :restrict_with_error
  has_many :people, through: :person_positions

  # callbacks
  after_initialize :set_defaults, if: :new_record?

  # default scope
  # default_scope order: 'lft'
  
  translates :description, :name, :slug if ActiveRecord::Base.connection.table_exists?(:ecm_staff_business_unit_translations)

  # friendly id support
  extend FriendlyId
  friendly_id :name, use: [:slugged]

  # markup support
  acts_as_markup language: :variable,
                 columns: [:description]

  # nested set support
  acts_as_nested_set

  # validations
  validates :name, presence: true,
                   uniqueness: { scope: [:organisation_id] }

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
