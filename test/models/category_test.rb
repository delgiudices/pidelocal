require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  should belong_to :store
  should have_many :products

end
