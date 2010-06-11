require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Language.new.valid?
  end
end
