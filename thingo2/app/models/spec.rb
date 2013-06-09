class Spec < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "150x180#", :thumb => "100x70#", :small =>"40x40#" }
  belongs_to :user
  acts_as_commentable


 
end
