class Vote < ActiveRecord::Base 
  belongs_to :topic     
  belongs_to :user 
  validates_presence_of :topic 
   
end
