module Test::Helpers::NoDelete
  module ClassMethods

  end

  module InstanceMethods

    def test_no_update
      cla = "Tend::#{self.class.to_s.gsub("Test", "")}".constantize
      assert_raises Tend::NotSupportedError do
        cla.new({}).delete
      end
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end