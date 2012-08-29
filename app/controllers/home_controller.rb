class HomeController < ApplicationController
 
  def index
    if request.post?
      budget ||= params[:budget]
      location ||= params[:loc]
      puts budget
      puts location
      if budget == 'Any'
        @portfolios = Portfolio.where(:location => location)
      end  
      @portfolios = Portfolio.where(:budget =>budget, :location => location) 
    else
      @portfolios = Portfolio.includes(:user).all
    end  
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

