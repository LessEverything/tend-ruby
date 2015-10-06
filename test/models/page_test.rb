require File.expand_path('../../../test/test_helper.rb', __FILE__)

class PageTest < Minitest::Test
  include Test::Helpers::All
  include Test::Helpers::NoFind
  include Test::Helpers::NoCreate
  include Test::Helpers::NoUpdate
  include Test::Helpers::NoDelete


end