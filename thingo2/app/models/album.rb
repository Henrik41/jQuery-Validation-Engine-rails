class Album < ActiveRecord::Base
  belongs_to :obj
  has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#", :small =>"40x40#" }
  
end
