class User < ApplicationRecord
  has_many :phones, class_name: 'UserPhone'

  accepts_nested_attributes_for :phones
end
