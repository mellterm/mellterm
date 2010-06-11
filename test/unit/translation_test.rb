require 'test_helper'

class TranslationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Translation.new.valid?
  end
end
