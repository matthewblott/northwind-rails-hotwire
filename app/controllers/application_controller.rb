class ApplicationController < ActionController::Base
  include Pagy::Backend
  helper_method :turbo_native_app?
  before_action :authenticate_employee!
end
