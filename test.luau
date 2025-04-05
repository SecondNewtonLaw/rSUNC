local timeBlake = 0
local timeSha = 0
local functionCount = 0

for _, obj in getgc(false) do
	if typeof(obj) ~= "function" or iscclosure(obj) then
		continue
	end
	functionCount += 1
	local start = tick()
	getfunctionhashsha(obj)
	local endt = tick()
	timeSha += endt - start
	start = tick()
	getfunctionhashblake2b(obj)
	endt = tick()
	timeBlake += endt - start
end

print(
	"Iterated over all functions on the garbage collector ("
		.. functionCount
		.. " functions), took "
		.. timeSha
		.. " seconds for SHA-384 and "
		.. timeBlake
		.. " seconds for Blake"
)
