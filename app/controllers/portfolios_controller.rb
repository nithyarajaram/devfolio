class PortfoliosController < ApplicationController
  
  include Carmen

  before_filter :authenticate_user!, :except => [:show]
  before_filter :get_portfolio, :only => [:show, :edit, :update, :destroy]

  def index
    @portfolios = Portfolio.find(:all)
  end

  def new
    @user = current_user

    if @user.portfolio
      flash[:notice] = "You already have a portfolio"
      redirect_to portfolio_path(@user.portfolio)
    else 
    @portfolio = Portfolio.new 
    end

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
    @portfolio = Portfolio.find(params[:id])
     if current_user.id != @portfolio.user_id
      flash[:notice] = "You cannot edit somebody else's portfolio"
      redirect_to root_path
     end

    @portfolio.update_attributes(params[:portfolio])
    flash[:notice] = "Your account is updated"
    redirect_to root_path 
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
     
    if current_user.id != @portfolio.user_id
      flash[:notice] = "You cannot edit somebody else's portfolio"
      redirect_to root_path
    end  

  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
     if session[:user] != @portfolio.user
      flash[:notice] = "You cannot edit somebody else's portfolio"
      redirect_to root_path
     else @portfolio.destroy
      redirect_to account_my_home_path, :notice => "Your portfolio is deleted"
     end
  end 

  def get_portfolio
    portfolio = Portfolio.find(params[:id])
  end 

  def portfolio_filter
    budget = params[:value]
    @portfolios = Portfolio.where(:budget == '#{params[:value]}')
    #@portfolios = Portfolio.where(:location == '#{params[:location]}' && :budget == '#{params[:budget]}')
  end 


end
