class Skill < ActiveRecord::Base
  attr_accessible :icon
  mount_uploader :icon, IconUploader  
end
