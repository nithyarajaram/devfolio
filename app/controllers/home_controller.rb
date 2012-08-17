class HomeController < ApplicationController
 
  def index
   # @users = User.includes(:portfolio).all
    @portfolios = Portfolio.find(:all)
  end
 
end

