def checkItems(out,item,items)
   # add the item to the list ONLY if it has not been added yet
   for i in items
     return i == item
   end
   # do this if flag is false
   printAndAddItem(out,item,items)  
end

def checkNotIncludeItems(out,item,items)
    if !items.include? item
        printAndAddItem(out,item,items)
    end
end

def checkConditions(conditions,weather_conditions_to_match,items,item,out)
   if conditions.all? {|condition| weather_conditions_to_match.include? condition }
      unless items.include? item
        printAndAddItem(out,item,items)
      end
   end
end

def printAndAddItem(out,item,items)
  out.puts item
  items << item
end