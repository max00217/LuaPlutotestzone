Ch = {"🥚", "🐔", "🍗", "🐥", "🐣", "🐤", "🐓"}
table.sort(Ch)

for i,v in ipairs(Ch) do
	io.write(v)
	if i ~= #Ch then
		io.write(", ")
	end
end
