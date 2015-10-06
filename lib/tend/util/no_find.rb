module Tend::Util::NoFind
  module ClassMethods

    def find *args
      raise Tend::NotSupportedError.new("Find method is not supported on this object.")
    end
  end

  module InstanceMethods

  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end