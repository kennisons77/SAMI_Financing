class Agreement < ActiveRecord::Base
  belongs_to :lender
  belongs_to :target
end
