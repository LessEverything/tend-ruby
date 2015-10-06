module Test::Helpers::NoFind
  module ClassMethods

  end

  module InstanceMethods

    def test_no_find
      cla = "Tend::#{self.class.to_s.gsub("Test", "")}".constantize
      assert_raises Tend::NotSupportedError do
        cla.find 1
      end
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end