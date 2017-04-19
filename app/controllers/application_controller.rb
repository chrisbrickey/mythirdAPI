class ApplicationController < ActionController::API

  #below lines let's the controller know that these helper methods are available
  include Response
  include ExceptionHandler

end
