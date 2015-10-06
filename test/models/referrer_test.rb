require File.expand_path('../../../test/test_helper.rb', __FILE__)

class ReferrerTest < Minitest::Test
  include Test::Helpers::All
  include Test::Helpers::NoCreate
  include Test::Helpers::NoUpdate
  include Test::Helpers::NoDelete

  def test_get_find
    assert_tend_class "referrer", "find", 1
  end

  def test_visits
    r = nil
    VCR.use_cassette("referrer_find") { r = Tend::Referrer.find 1}
    assert_tend_instance r, "visits"
  end

  def test_contacts
    r = nil
    VCR.use_cassette("referrer_find") { r = Tend::Referrer.find 1}
    assert_tend_instance r, "contacts"
  end

end