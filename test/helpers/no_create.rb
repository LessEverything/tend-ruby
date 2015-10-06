module Test::Helpers::NoCreate
  module ClassMethods

  end

  module InstanceMethods

    def test_no_create
      cla = "Tend::#{self.class.to_s.gsub("Test", "")}".constantize
      assert_raises Tend::NotSupportedError do
        cla.create 1
      end
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end