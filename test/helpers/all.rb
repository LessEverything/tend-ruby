module Test::Helpers::All
  module ClassMethods

  end

  module InstanceMethods

    def test_get_all
      cla = self.class.to_s.gsub("Tend::", "").gsub("Test", "").downcase
      assert_tend_class cla, "all"
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end