class Portfolio < ActiveRecord::Base
  attr_accessible :budget, :description, :githuburl, :location, :name
  validates_presence_of :budget, :message => "^Please enter your budget"
  validates_presence_of :description, :message => '^Please add a description about yourself and your projects'
  validates_presence_of :githuburl, :location

  include Carmen

  belongs_to :user

  before_save :location_check

  def location_check
    self.location = Carmen::Country.coded("#{self.location}").name 
  end  

end
