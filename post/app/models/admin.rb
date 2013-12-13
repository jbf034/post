class Admin < ActiveRecord::Base
  attr_accessible :manage, :manage_type, :password
end
