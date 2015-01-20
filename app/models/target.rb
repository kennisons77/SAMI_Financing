class Target < ActiveRecord::Base
  belongs_to :borrower
  belongs_to :deal
end
