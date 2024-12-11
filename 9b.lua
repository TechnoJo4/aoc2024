local f; f = io.open("i/9"); local input = f:read("*a"); f:close()

local l, h = {}, {}

local id = 0
local pos = 0
for i=1,#input-1 do
	local len = tonumber(input:sub(i,i))
	if i % 2 == 1 then
		l[#l+1] = { len, pos, id }
		id = id + 1
	else
		h[#h+1] = { len, pos }
	end
	pos = pos + len
end

for il=#l,1,-1 do
	for i=1,#h do
		if h[i][1] >= l[il][1] then
			l[il][2] = h[i][2] -- move
			h[i][1] = h[i][1] - l[il][1] -- resize
			h[i][2] = h[i][2] + l[il][1] -- move
			break
		end
		if i >= il then break end
	end
end

local sum = 0
for i=1,#l do
	local n = l[i][1]
	sum = sum + l[i][3] * ((n-1)*n/2 + n*l[i][2])
end
print(sum)
