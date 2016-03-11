# function to sort an array of arrays based on a property. Will be used to divide data in Strands and Standards.
# Index is the index of the property we are sorting on
def groupByProp(arr, index)
  # create an object. Keys are a property. Values are an array of arrays.
  obj = {
  }
  # go through inner arrays grouping them into arrays based on property

  arr.each do |inner|
    key = inner[index]
    #check if key exists
    if (obj[key]!=nil)
      #if so push current inner array to the corresponding object[key] array
      obj[key].push(inner)
    else
      #else make a new key value pair
      obj[key] = [inner]
    end
  end
  #transform the object into an array of arrays
  sortedArr = []
  obj.each do |key, array|
    sortedArr.push(obj[key])
  end
  #return the sorted array
  return sortedArr
end

#function to divide items into integer groups of similar size. Used to divide questions between strands and standards.
def equalSizeGroups(items, groups)
  #create an array to store the size of each group
  result = []
  #calculate how large each group should be
  size = items/groups
  #calculate the remainder of dividing items by groups. The excess items must be put in a group
  remainder = items%groups
  #create the groups
  for i in 1..groups
    temp = size
    if (remainder>0)
      temp+=1
      remainder-=1
    end
    result.push(temp)
  end
  return result
end

#function to choose a random element in an array. used to choose a random question.
def randomElm(arr)
  return arr[rand(arr.length)]
  #expand on this to weight questions not seen and questions not answered more heavily
end

#function to sort a standard by question difficulty from most (1) difficult to least(0)
def sortByDifficulty(arr, index)
  return arr.sort {|a,b| b[index].to_f <=> a[index].to_f}
end
