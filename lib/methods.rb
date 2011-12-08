def checkItems(out,item,items)
   # add the item to the list ONLY if it has not been added yet
   for i in items
     return i == item
   end
   # do this if flag is false
   out.puts item
   items << item  
end

def checkNotIncludeItems(out,item,items)
    if !items.include? item
      out.puts item
      items << item
    end
end

def checkConditions(conditions,weather_conditions_to_match,items,item,out)
   if conditions.all? {|condition| weather_conditions_to_match.include? condition }
    unless items.include? item
      out.puts item
      items << item
     end
   end
end