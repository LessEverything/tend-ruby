
class Tend::Garden
  include Tend::Util::Ht
  include Tend::Util::Util


  def initialize attributes
    a = HashWithIndifferentAccess.new attributes
    init(a) do |att, value|
      send("#{att}=", value)
    end
  end

  class << self
    def all options = {}
      response = get options
      response.map { |object| new(object) }
    end

    def find id, options = {}
      new( get( options.merge(id: id) ) )
    end

    def create attributes, options = {}
      post attributes, options
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
    a = []
    response.each do |h|
      a << cla.new(h)
    end
    a
 end

end