class AccountController < ApplicationController

before_filter :authenticate_user! 

  def my_home
    @user = current_user
  end
end
