class Role < ActiveRecord::Base
  has_many :users
  
accepts_nested_attributes_for :user
end
