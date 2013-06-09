class Obj < ActiveRecord::Base
  belongs_to :user
  has_many :parametres
  has_many :category2s, :dependent => :destroy
  acts_as_followable  
  ajaxful_rateable :stars => 5, :dimensions => [:speed]
  has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#", :small =>"40x40#" }
  accepts_nested_attributes_for :parametres, 
                                  :allow_destroy => true, 
                                  :reject_if => :all_blank
                                  
  accepts_nested_attributes_for :category2s, 
                                :allow_destroy => true, 
                               :reject_if => :all_blank
                               
  acts_as_commentable
  has_many :albums
  paginates_per 5

                    
                    
end
