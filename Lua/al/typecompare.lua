local comparetable = {0, 0/0, true, false, nil}

for i = 1, #comparetable+1 do
	for j = 1, #comparetable+1 do
		print(comparetable[i]," == ",comparetable[j],":",comparetable[i] == comparetable[j])
		if j == #comparetable+1 then
			print()
		end
	end
end
