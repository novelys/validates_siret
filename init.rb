require 'validates_siret'
ActiveRecord::Base.send(:include, ValidatesSiret)
