
require "version"
require "httparty"
require "active_support"
require "active_support/core_ext"

module Tend::Util
end

require "tend/util/ht"
require "tend/util/util"
require "tend/util/no_post"
require "tend/util/no_update"
require "tend/util/no_delete"
require "tend/util/no_find"
require "tend/errors/http_error"
require "tend/errors/not_supported_error"
require "tend/models/collection"
require "tend/models/garden"
require "tend/models/campaign"
require "tend/models/contact"
require "tend/models/page"
require "tend/models/segment"
require "tend/models/referrer"
require "tend/models/visit"

module Tend

  URI = "https://tend.io/api/v1/"

  class << self
    attr_accessor :user_name, :password
  end
end

