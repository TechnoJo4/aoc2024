local f; f = io.open("i/3"); local input = f:read("*a"); f:close()

local sum = 0
for a,b in input:gmatch("mul%((%d-),(%d-)%)") do
	sum = sum + tonumber(a)*tonumber(b)
end
print(sum)

local dont = false
local L = {0}
for l in input:gmatch("do()") do
	local new_dont = input:sub(l,l+2) == "n't"
	local o = new_dont and 3 or 0
	if input:sub(l+o,l+o+1) == "()" and dont ~= new_dont then
		dont = new_dont
		L[#L+1] = l
	end
end
L[#L+1] = #input

local i = 1
local sum = 0
for l,a,b in input:gmatch("()mul%((%d-),(%d-)%)") do
	while l > L[i] do i = i + 1 end
	if (i % 2) == 0 then
		sum = sum + tonumber(a)*tonumber(b)
	end
end
print(sum)
