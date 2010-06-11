require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Content.new.valid?
  end
end
