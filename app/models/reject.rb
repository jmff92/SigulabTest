class Reject < ActiveRecord::Base
  
   belongs_to :user
   belongs_to :specification
end
