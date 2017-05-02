class Dare < ActiveRecord::Base
  attr_accessible :answer, :priv, :question, :user_id
  belongs_to :user
end
