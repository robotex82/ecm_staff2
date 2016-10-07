module Ecm::Staff
  class PeopleController < ApplicationController
    def self.resource_class
      Person
    end

    def index
      @collection = load_collection
    end

    def show
      @resource = load_resource
    end

    private

    def resource_class
      self.class.resource_class
    end

    def resource_scope
      resource_class.includes(person_positions: :position)
    end

    def load_collection
      resource_scope.all
    end

    def load_resource
      resource_scope.find(params[:id])
    end
  end
end