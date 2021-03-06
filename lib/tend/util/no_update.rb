module Tend::Util::NoUpdate
  module ClassMethods

  end

  module InstanceMethods
    def update *args
      raise Tend::NotSupportedError.new("Update method is not supported on this object.")
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end