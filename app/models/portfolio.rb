class Portfolio < ActiveRecord::Base
  attr_accessible :budget, :description, :githuburl, :location, :name

  belongs_to :user

end
