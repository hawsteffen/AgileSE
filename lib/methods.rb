def checkItems(itemWrap)
   # add the item to the list ONLY if it has not been added yet
   for i in itemWrap.getItems
     return i == itemWrap.getItem
   end
   # do this if flag is false
   printAndAddItem(itemWrap)  
end

def checkNotIncludeItems(itemWrap)
    if !itemWrap.getItems.include? itemWrap.getItem
        printAndAddItem(itemWrap)
    end
end

def checkConditions(conditions,weather_conditions_to_match,itemWrap)
   if conditions.all? {|condition| weather_conditions_to_match.include? condition }
      unless itemWrap.getItems.include? itemWrap.getItem
        printAndAddItem(itemWrap)
      end
   end
end

def printAndAddItem(itemWrap)
  itemWrap.getOut.puts itemWrap.getItem
  itemWrap.getItems << itemWrap.getItem
end