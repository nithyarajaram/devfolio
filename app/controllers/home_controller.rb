class HomeController < ApplicationController
 
  def index
    @portfolios = Portfolio.includes(:user).all
    @portfolios_location = location_list
    @portfolios_budget = budget_list
  end

  def location_list
    Portfolio.select("distinct(location)").where("location IS NOT NULL").each {|portfolio| portfolio.location} 
  end    
  
  def budget_list
     Portfolio.select("distinct(budget)").where("budget IS NOT NULL").each {|portfolio| portfolio.budget} 
  end   
 
end

