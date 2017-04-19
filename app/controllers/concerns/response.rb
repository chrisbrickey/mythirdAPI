#created file from scratch

module Response

  #this helper method responds with JSON and an HTTP status code (200 by default)
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
