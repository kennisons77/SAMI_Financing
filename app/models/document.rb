class Document < ActiveRecord::Base
  validates :title, :type, presence: true
  
  belongs_to :deal
end
