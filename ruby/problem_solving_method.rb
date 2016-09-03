def search_array(arr,integer)
	instances=[]
  for index in 0..arr.length-1
    if integer == arr[index]
      instances << index
    end
    # return index
  end
  if !instances.empty?
  	instances.each{|x| puts "#{integer} is at #{x} position in the array"}
  else
  	puts "Integer not in the array!"
  end
end
array=[1,2,2,1]
# if search_array(array) == array.length

search_array(array,10)