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
    instances
  else
  	puts "Integer not in the array!"
  end
end


# array=[1,2,2,1]
def fib(num)
  fib_array = [0,1]
  if num > 2 
    for i in 2...num do
      fib_array[i]=fib_array[i-1]+fib_array[i-2]
    end
  elsif num == 2 
    fib_array
  elsif num == 1 
      fib_array.delete(1) 
  else
    puts "Number to small"
  end
  fib_array
end

fib 6
search_array fib(100), 218922995834555169026