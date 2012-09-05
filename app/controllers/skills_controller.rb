class SkillsController < ApplicationController
 
  def index
    @skills = Skill.find(:all)
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def create
    @skill = Skill.new(params[:skill])
    @skill.save
    redirect_to skill_path(@skill), :notice => "Thanks for adding a new skill!"
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def new
    @skill = Skill.new
  end

end
