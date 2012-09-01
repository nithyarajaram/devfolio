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

  def search_by_filter
    budget = params[:budget]
    location = params[:loc]

    if budget.blank? && !location.blank?
      @portfolios = Portfolio.where(:location => location)
    elsif location.blank? && !budget.blank?
      @portfolios = Portfolio.where(:budget => budget)
    elsif (!budget.blank? && !location.blank?)
      @portfolios = Portfolio.where(:budget => budget, :location => location)
    elsif (budget.blank? && location.blank?)
      @portfolios = Portfolio.find(:all)
    end  
  end

end
