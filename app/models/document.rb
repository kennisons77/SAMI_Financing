class Document < ActiveRecord::Base
   include ActiveRecordExtension
 validates :title, :type, presence: true
  
  enum type: [ :marketing, :administrative ]

  belongs_to :deal

  scope :marketing, -> { where(active: document) }
  scope :document, -> { where(type: document) }

  DISPLAY_COLS = ["title"=>"Title","type"=>"Type","url"=>"URL"]
  
  PARENT = ["deal"]
end
