
class Tend::Contact < Tend::Garden
  include Tend::Util::NoPost

  ATTRIBUTES = [:id, :name, :firstName, :lastName, :email, :company, :title, :bio, :website, :address, :city, :state, :zip, :country, :photo, :facebook, :twitter, :linkedin, :activity, :segments, :referrers, :campaigns]

  attr_accessor :attributes, *ATTRIBUTES

  def initialize *args
    init(*args) do |att, value|
      case att
      when :segments
        a = []
        value.each do |h|
          a << Tend::Segment.new( h )
        end
        @segments = a
      when :campaign
        a = []
        value.each do |h|
          a << Tend::Campaign.new( h )
        end
        @campaigns = a
      when :referrer
        a = []
        value.each do |h|
          a << Tend::Referrer.new( h )
        end
        @referrers = a
      else
        send("#{att}=", value)
      end
    end
  end

  def visits options = {}
    return @visits if @visits && !options.delete(:reload)
    collection "visits", Tend::Visit, options
  end

  def segments options = {}
    return @segments if @segments && !options.delete(:reload)
    collection "segments", Tend::Segment, options
  end

end

