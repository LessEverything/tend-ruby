module Tend::Util::NoPost
  module ClassMethods

    def post *args
      raise Tend::NotSupportedError.new("Post method is not supported on this object.")
    end
  end

  module InstanceMethods

  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end