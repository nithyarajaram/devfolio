class HomeController < ApplicationController
 
  def index
    @portfolios = Portfolio.includes(:user).all
  end
 
end

