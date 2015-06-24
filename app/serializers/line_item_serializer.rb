class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :beer_name, :weight

  def beer_name
    @object.beer.name
  end
end
