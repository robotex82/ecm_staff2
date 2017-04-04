module Ecm
  module StaffHelper
    def render_people
      @collection = Ecm::Staff::Person.all
      render partial: 'ecm/staff/people/person_in_index', collection: @collection, as: :person, locals: { view: self }
    end
  end
end