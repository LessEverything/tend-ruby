class Tend::Collection < Array

  attr_accessor :total_count, :total_pages, :current_page, :limit

  def init paginator = {}
    return unless paginator
    paginator.each do |k,v|
      next unless respond_to? "#{k}="
      send "#{k}=", v
    end
  end

end