class Ballot < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def swap(li1, li2)
    li1_weight = li1.weight
    li2_weight = li2.weight
    li1.weight = li2_weight
    li2.weight = li1_weight
    li1.save && li2.save
  end
end
