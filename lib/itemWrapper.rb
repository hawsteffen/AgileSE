class ItemWrapper
  
  attr_accessor :out, :item, :items
  attr_reader :out, :item, :items

  def initialize(out,item,items)
    @out = out
    @item = item
    @items = items
  end
  
end