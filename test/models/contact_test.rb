require File.expand_path('../../../test/test_helper.rb', __FILE__)

class ContactTest < Minitest::Test
  include Test::Helpers::All
  include Test::Helpers::NoCreate


  def test_get_find
    assert_tend_class "contact", "find", 1
  end

  def test_get_visits
    assert_tend_instance contact, "visits", {reload: true}
  end

  def test_get_segments
    assert_tend_instance contact, "segments", {reload: true}
  end

  def test_update
    assert_tend_instance contact, "update", {lastName: "Bristoll"}
  end

  def test_delete
    assert_tend_instance contact, "delete"
  end

  def contact
    c = nil
    VCR.use_cassette("contact_find") do
      c = Tend::Contact.find 1
    end
    c
  end

end