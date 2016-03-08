class Store < ActiveRecord::Base
    has_many :categories
    has_many :products
    has_one :user
    has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
end
