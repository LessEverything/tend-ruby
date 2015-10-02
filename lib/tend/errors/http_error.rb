class Tend::HttpError < Exception
  attr_accessor :response, :code

  def initialize msg = nil, code = nil, response = nil
    super msg
    @code = code
    @response = response
  end

end