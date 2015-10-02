
module Tend::Util::Ht
  include HTTParty
  module ClassMethods

    def get options = {}
      o = extract_options options
      handle_response( HTTParty.get( uri(o), :basic_auth => o.auth ) )
    end

    def post attributes, options = {}
      o = extract_options options
      o.no_pagination = true
      handle_response( HTTParty.post( uri(o), body: attributes, :basic_auth => o.auth ) )
    end


    private

    def handle_response response
      case response.code
      when 200..299
        response.parsed_response["data"] || response.parsed_response["message"]
      when 422
        HashWithIndifferentAccess.new response.parsed_response
      else
        raise Tend::HttpError.new("#{response.response.message} #{response.code}", response.code, response)
      end
    end

  end

  module InstanceMethods

    def delete options = {}
      o = extract_options options
      o._method = "delete"
      self.class.send( :handle_response, HTTParty.post( uri(o), :basic_auth => o.auth ) )
    end

    def update attributes, options = {}
      o = extract_options options
      o._method = "put"
      self.class.send( :handle_response, HTTParty.post( uri(o), body: attributes, :basic_auth => o.auth ) )
    end

    def get options = {}
      self.class.get options
    end

  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end