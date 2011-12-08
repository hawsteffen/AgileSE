def checkItems(out,item,items)
   # add the item to the list ONLY if it has not been added yet
   for i in items
     return i == item
   end
   # do this if flag is false
   out.puts item
   items << item  
end