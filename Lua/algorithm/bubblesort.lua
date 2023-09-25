math.randomseed(os.time())

local sorter = {math.random(1, 10), math.random(1, 10), math.random(1, 10), math.random(1, 10), math.random(1, 10), math.random(1, 10), math.random(1, 10), math.random(1, 10), math.random(1, 10)}
print(table.concat(sorter, ", "))
for i = 1, #sorter-1 do
    for j = 1, #sorter-i do
        if sorter[j] > sorter[j+1] then
            sorter[j], sorter[j+1] = sorter[j+1], sorter[j]
            print("sorting... "..table.concat(sorter, ", "),"\n")
        end
    end
end

print("Result: "..table.concat(sorter, ", "))
