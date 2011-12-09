def checkItems(itemWrap)
   # add the item to the list ONLY if it has not been added yet
   for i in itemWrap.items
     return i == itemWrap.item
   end
   # do this if flag is false
   printAndAddItem(itemWrap)  
end

def checkNotIncludeItems(itemWrap)
    if !itemWrap.items.include? itemWrap.item
        printAndAddItem(itemWrap)
    end
end

def checkConditions(conditions,weather_conditions_to_match,itemWrap)
   if conditions.all? {|condition| weather_conditions_to_match.include? condition }
      unless itemWrap.items.include? itemWrap.item
        printAndAddItem(itemWrap)
      end
   end
end

def printAndAddItem(itemWrap)
  itemWrap.out.puts itemWrap.item
  itemWrap.items << itemWrap.item
end