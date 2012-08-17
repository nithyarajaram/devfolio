class PortfolioController < ApplicationController
  
  def index
    @portfolios = Portfolio.find(:all)
  end

  def new
     @portfolio = Portfolio.new
  end

  def create
    if request.post?
    @portfolio = Portfolio.create(params[:portfolio])
    #if @portfolio.save
     redirect_to @portfolio 
     # :notice => "Your portfolio was successfully created"
    # end
  end
  end  

  def show
    @portfolio = Portfolio.find(params[:id])
  end  

end  
