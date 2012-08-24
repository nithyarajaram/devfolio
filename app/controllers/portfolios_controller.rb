class PortfoliosController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_portfolio, :only => [:show, :edit, :update, :destroy]

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
  end 

  def update
  
   if @portfolio.update_attributes(params[:portfolio])
     redirect_to account_my_home_path, :notice => "Your portfolio is updated"
   else
    redirect_to edit_portfolio_path, :notice => "Please try again"
   end  
  end

  

  def edit
  end

  def destroy
   if @portfolio.destroy
   redirect_to account_my_home_path, :notice => "Your portfolio is deleted"
   else
     redirect_to account_my_home_path, :notice => "Deletion could not be completed. Please try again"
    end
  end 

  def get_portfolio
  @portfolio = Portfolio.find(params[:id])
  end  

end
