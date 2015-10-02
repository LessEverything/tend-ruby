
class Tend::Campaign < Tend::Garden
  include Tend::Util::NoPost

  ATTRIBUTES = [:id, :domain, :name, :source, :medium, :term, :content, :start, :end, :image, :notes]
  attr_accessor :attributes, *ATTRIBUTES

  def visits options = {}
    collection "visits", Tend::Visit, options
  end

  def contacts options = {}
    collection "contacts", Tend::Contact, options
  end
end

