class Category < ActiveRecord::Base

  scope :for_store, ->(user) { where(store_id: user.store_id) }

  belongs_to :store
  has_many :products

  validates :name, presence: true
  validates :identifier, presence: true
  validates :store, presence: true

end
