class Portfolio < ActiveRecord::Base
  attr_accessible :budget, :description, :githuburl, :location, :name

  include Carmen

  belongs_to :user

  before_save :location_check

  def location_check
    self.location = Carmen::Country.coded("#{self.location}").name 
  end  

end
