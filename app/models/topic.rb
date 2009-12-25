class Topic < ActiveRecord::Base   
  has_many :votes
  ajaxful_rateable :stars => 5
end
