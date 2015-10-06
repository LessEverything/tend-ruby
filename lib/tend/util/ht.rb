
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
        data = response.parsed_response["data"]
        message = response.parsed_response["message"]
        paginator = response.parsed_response["paginator"]
        {data: data, message: message, paginator: paginator}
      when 422
        HashWithIndifferentAccess.new response.parsed_response
      else
        raise Tend::HttpError.new("#{response.response.message} #{response.code}", response.code, response)
      end
    end

  end

  module InstanceMethods

    def delete options = {}
      o = extract_options options.merge(id: id, no_pagination: true)
      initialize self.class.send( :handle_response, HTTParty.delete( uri(o), :basic_auth => o.auth ) )[:data]
      self
    end

    def update attributes, options = {}
      o = extract_options options.merge(id: id, no_pagination: true)
      initialize self.class.send( :handle_response, HTTParty.put( uri(o), body: attributes, :basic_auth => o.auth ) )[:data]
      self
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