#created this file from scratch

module RequestSpecHelper

  #this customer helper method (json) parses the JSON response to a Ruby Hash which is easier to work with in testing
  def json
    JSON.parse(response.body)
  end

end
