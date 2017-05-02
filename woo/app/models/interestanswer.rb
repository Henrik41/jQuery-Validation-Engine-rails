class Interestanswer < ActiveRecord::Base
  attr_accessible :answer, :name, :yactivity_id, :user_id
  belongs_to :user
end
