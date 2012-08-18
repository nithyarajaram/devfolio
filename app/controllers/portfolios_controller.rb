class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.find(:all)
  end

  def new
    @user = current_user
    @portfolio = Portfolio.new 
  end  

  def create
    
    @portfolio = Portfolio.new(params[:portfolio])
    @portfolio.user = current_user
   
    
    if @portfolio.save
      flash[:notice] = "Your portfolio is created"
      redirect_to @portfolio
    else
      render new_portfolio_path, :notice => "Please try again"
    end  
    
  end  

  def show
    @portfolio = Portfolio.find(params[:id])
  end  

end
