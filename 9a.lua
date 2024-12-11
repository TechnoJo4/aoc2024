local f; f = io.open("i/9"); local input = f:read("*a"); f:close()

local l, h = {}, {}
local oi, ol = {}, {}

for i=1,#input-1,2 do l[#l+1] = tonumber(input:sub(i,i)) end
for i=2,#input-1,2 do h[#h+1] = tonumber(input:sub(i,i)) end

local function o(_i, _l)
	oi[#oi+1] = _i-1
	ol[#ol+1] = _l
end

local il = #l
for ih=1,#h do
	o(ih, l[ih])
	l[ih] = 0

	local B = false
	while h[ih] > 0 do
		local m = math.min(l[il], h[ih])
		l[il] = l[il] - m
		h[ih] = h[ih] - m
		o(il, m)

		if l[il] == 0 then
			il = il - 1
			if il <= ih then
				B = true
				break
			end
		end
	end
	if B then break end
end

local sum = 0
local count = 0
for i=1,#oi do
	local n = ol[i]
	sum = sum + oi[i] * ((n-1)*n/2 + n*count)
	count = count + n
end
print(sum)
