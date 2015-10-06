require File.expand_path('../../../test/test_helper.rb', __FILE__)

class CampaignTest < Minitest::Test
  include Test::Helpers::All
  include Test::Helpers::NoCreate


  def test_get_find
    assert_tend_class "campaign", "find", 1
  end

  def test_update
    assert_tend_instance campaign, "update", {name: "test2"}
  end

  def test_delete
    assert_tend_instance campaign, "delete"
  end

  def test_visits
    assert_tend_instance campaign, "visits"
  end

  def test_contacts
    assert_tend_instance campaign, "contacts"
  end


  def campaign
    s = nil
    VCR.use_cassette("campaign_find") do
      s = Tend::Campaign.find 1
    end
    s
  end

end