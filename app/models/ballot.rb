class Ballot < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy

  attr_accessor :beers

  before_create :assign_line_items

  def swap(li1, li2)
    li1_weight = li1.weight
    li2_weight = li2.weight
    li1.weight = li2_weight
    li2.weight = li1_weight
    li1.save && li2.save
  end

  private
  def assign_line_items
    beers.each_with_index do |b, i|
      self.line_items.build(beer: b, weight: i+1)
    end
  end
end
