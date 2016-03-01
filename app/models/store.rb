class Store < ActiveRecord::Base
    has_many :categories
    has_one :user
end
