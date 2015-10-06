module Tend::Util::NoDelete
  module ClassMethods

  end

  module InstanceMethods
    def delete *args
      raise Tend::NotSupportedError.new("Delete method is not supported on this object.")
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end