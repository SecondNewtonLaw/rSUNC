local timeBlake2b = 0
local timeBlake3 = 0
local timeSha = 0
local functionCount = 0

local superRealGc = getgc(false)
local x = 0
repeat
	for _, v in getgc(false) do
		if typeof(v) ~= "function" or iscclosure(v) then
			continue
		end
		table.insert(superRealGc, v)
	end
	if x % 100 then
		task.wait()
	end
	x += 1
until x > 100

for _, obj in superRealGc do
	if typeof(obj) ~= "function" or iscclosure(obj) then
		continue
	end
	functionCount += 1
	local start = tick()
	getfunctionhash(obj, "SHA512")
	local endt = tick()
	timeSha += endt - start
	start = tick()
	getfunctionhash(obj, "BLAKE2B")
	endt = tick()
	timeBlake2b += endt - start
	start = tick()
	getfunctionhash(obj, "BLAKE3")
	endt = tick()
	timeBlake3 += endt - start
end

print(
	"Iterated over all functions on the garbage collector ("
		.. functionCount
		.. " functions), took "
		.. timeSha
		.. " seconds for SHA-384 and "
		.. timeBlake2b
		.. " seconds for Blake2B and "
		.. timeBlake3
		.. " seconds for Blake3."
)
