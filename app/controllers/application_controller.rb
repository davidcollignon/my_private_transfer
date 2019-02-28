class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :generate_css_class

  def generate_css_class
    @cssclass = params[:action]
  end
end
