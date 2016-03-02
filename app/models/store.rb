class Store < ActiveRecord::Base
    has_many :categories
    has_many :products
    has_one :user
end
