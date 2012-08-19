class PortfoliosController < ApplicationController

  before_filter :authenticate_user!

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

  def update
   @portfolio= Portfolio.find(params[:id])
   @portflio.update_attributes(params[:portfolio])
  end

  def edit
  end  

end
