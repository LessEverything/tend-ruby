
class Tend::Garden
  include Tend::Util::Ht
  include Tend::Util::Util

  attr_accessor :attributes
  def initialize attributes
    a = HashWithIndifferentAccess.new attributes
    init(a) do |att, value|
      send("#{att}=", value)
    end
  end

  class << self
    def all options = {}
      response = get options
      fill_collection response, self
    end

    def find id, options = {}
      new( get( options.merge(id: id, no_pagination: true) )[:data] )
    end

    def create attributes, options = {}
      new( post( attributes, options)[:data] )
    end

  end

 private


 def init attributes
   @attributes = attributes
   @attributes.each do |att, value|
     yield att, value
   end
 end

 def collection name, cla, options = {}
    response = get options.merge(collection: name, id: id)
    self.class.fill_collection response, cla
 end

end