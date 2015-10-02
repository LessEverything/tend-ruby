module Tend::Util::NoUpdate
  module ClassMethods

    def post *args
      raise Tend::NotSupportedError.new("Update method is not supported on this object.")
    end
  end

  module InstanceMethods

  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end