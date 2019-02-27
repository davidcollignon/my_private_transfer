class PagesController < ApplicationController

  layout "home", only: [:home]

  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
  end

  def index
  end
end
