class Product < ActiveRecord::Base

  belongs_to :store
  belongs_to :category

  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :store, presence: true

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

end
