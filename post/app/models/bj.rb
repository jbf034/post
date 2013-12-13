class Bj < ActiveRecord::Base
  attr_accessible :bj_num, :bj_name
  set_primary_key "bj_num"
  has_many :users 
  end
