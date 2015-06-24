class LineItem < ActiveRecord::Base
  belongs_to :beer
  belongs_to :ballot

  validates_presence_of :weight
end
