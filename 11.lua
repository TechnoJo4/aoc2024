local f; f = io.open("i/11"); local input = f:read("*a"); f:close()

local function i(t,k,v) t[k] = (t[k] or 0) + v end

local t = {}
for n in input:gmatch("(%d-)%s") do
	i(t, tonumber(n), 1)
end

local function step()
	local new = {}
	for k,n in pairs(t) do
		if k == 0 then
			i(new, 1, n)
		else
			local s = string.format("%d", k)
			if #s % 2 == 0 then
				local l = (#s)/2
				i(new, tonumber(s:sub(1+l)), n)
				i(new, tonumber(s:sub(1,l)), n)
			else
				i(new, 2024*k, n)
			end
		end
	end
	t = new
end

for i=1,25 do step() end

local sum = 0
for _,v in pairs(t) do sum = sum + v end
print(string.format("%d", sum))

for i=1,50 do step() end

sum = 0
for _,v in pairs(t) do sum = sum + v end
print(string.format("%d", sum))
