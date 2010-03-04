# Siret Validation Model helper

require "rails/active_support/concern"
require 'siret'

module ValidatesSiret
  extend ActiveSupport::Concern
  
  module ClassMethods
    # Method to validate in the receiving model that the value is a valid SIRET Number
    def validates_siret(*attr_names)
        configuration = attr_names.extract_options!

        validates_each(attr_names, configuration) do |record, attr_name, value|
          unless Siret.valid? value
              record.errors.add(attr_name, :invalid, :default => configuration[:message], :value => value)
          end
        end
    end
  end
end
