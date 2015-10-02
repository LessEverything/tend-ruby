

module Tend::Util::Util
  module ClassMethods

    private
    def extract_options options = {}
      o = OpenStruct.new({
        page:           options[:page] || 1,
        user_name:      options[:user_name] || Tend.user_name,
        password:       options[:password] || Tend.password,
        id:             options[:id],
        collection:     options[:collection],
        no_pagination:  options[:no_pagination]
      })
      o.auth ={:username => o.user_name, :password => o.password}
      o
    end

    def uri options
      u = "#{Tend::URI}#{self.to_s.gsub("Tend::", "").downcase.pluralize}"
      if options.id
        u += "/#{options.id}"
      end
      if options.collection
        u += "/#{options.collection}" if options.collection
      end
      if !options.no_pagination
        u += "?page=#{options.page}"
      end
      u
    end

  end

  module InstanceMethods

    private
    def extract_options options = {}
      self.class.send :extract_options, options
    end

    def uri options
      self.class.send :uri, options
    end

  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
