class Ecm::Staff::PersonPosition < Ecm::Staff::Base
  # associations
  has_one    :organisation, through: :business_unit
  belongs_to :business_unit
  belongs_to :person, class_name: Ecm::Staff::Configuration.person_class_name
  belongs_to :position

  # validations
  # @TODO: Validate end_at > begin_at if present
  validates :begin_at,      presence: true
end
