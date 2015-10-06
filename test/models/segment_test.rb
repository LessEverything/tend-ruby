require File.expand_path('../../../test/test_helper.rb', __FILE__)

class SegmentTest < Minitest::Test
  include Test::Helpers::All

  def test_create
    assert_tend_class "segment", "create", {name: "test by steve 2"}
  end

  def test_get_find
    assert_tend_class "segment", "find", 1
  end

  def test_update
    assert_tend_instance segment, "update", {name: "test2"}
  end

  def test_delete
    assert_tend_instance segment, "delete"
  end

  def test_assign_one_string
    assert_tend_class "segment", "assign|one_string", "stevenbristol@gmail.com", "renamed test by steve e31f1b3a-20bd-4605-9844-bab71e230212"
  end

  def test_assign_as_strings
    assert_tend_class "segment", "assign|as_strings", "stevenbristol@gmail.com", "renamed test by steve e31f1b3a-20bd-4605-9844-bab71e230212,renamed test by steve 96f63274-9dc3-407a-98a0-21d54bd3f590"
  end

  def test_assign_one_array
    assert_tend_class "segment", "assign|one_array", "stevenbristol@gmail.com", ["renamed test by steve e31f1b3a-20bd-4605-9844-bab71e230212"]
  end

  def test_assign_as_array
    assert_tend_class "segment", "assign|as_array", "stevenbristol@gmail.com", ["renamed test by steve e31f1b3a-20bd-4605-9844-bab71e230212","renamed test by steve 96f63274-9dc3-407a-98a0-21d54bd3f590"]
  end

  def test_detach_one_string
    assert_tend_class "segment", "detach|one_string", "stevenbristol@gmail.com", "renamed test by steve e31f1b3a-20bd-4605-9844-bab71e230212"
  end

  def test_detach_as_strings
    assert_tend_class "segment", "detach|as_strings", "stevenbristol@gmail.com", "renamed test by steve e31f1b3a-20bd-4605-9844-bab71e230212,renamed test by steve 96f63274-9dc3-407a-98a0-21d54bd3f590"
  end

  def test_detach_one_array
    assert_tend_class "segment", "detach|one_array", "stevenbristol@gmail.com", ["renamed test by steve e31f1b3a-20bd-4605-9844-bab71e230212"]
  end

  def test_detach_as_array
    assert_tend_class "segment", "detach|as_array", "stevenbristol@gmail.com", ["renamed test by steve e31f1b3a-20bd-4605-9844-bab71e230212","renamed test by steve 96f63274-9dc3-407a-98a0-21d54bd3f590"]
  end

  def segment
    s = nil
    VCR.use_cassette("segment_find") do
      s = Tend::Segment.find 1
    end
    s
  end

end