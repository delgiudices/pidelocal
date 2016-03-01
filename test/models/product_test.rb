require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  should belong_to :store

  should validate_presence_of :name
  should validate_presence_of :quantity
  should validate_presence_of :price
  should validate_presence_of :category
  should validate_presence_of :store
end
