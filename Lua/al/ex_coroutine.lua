-- local myCoroutine = coroutine.create(
--     function()
--         print("Coroutine started")
--         local x = coroutine.yield(1)
--         print("Coroutine resumed with value", x)
--         local y = coroutine.yield(2)
--         print("Coroutine resumed with value", y)
--         local z = coroutine.yield(3)
--         print("Coroutine resumed with value", z)
--         local w = coroutine.yield(4)
--         print("Coroutine finished")
--     end
-- )

-- local status, value = coroutine.resume(myCoroutine)
-- print("Coroutine status:", status, "Coroutine value:", value)

-- local status, value = coroutine.resume(myCoroutine, "Hello")
-- print("Coroutine status:", status, "Coroutine value:", value)

-- local status, value = coroutine.resume(myCoroutine, "World")
-- print("Coroutine status:", status, "Coroutine value:", value)

-- local status, value = coroutine.resume(myCoroutine, "!")
-- print("Coroutine status:", status, "Coroutine value:", value)

local newcoroutine = coroutine.create(
    function()
        print("Testing coroutine")
        local q = coroutine.yield("1")
        print("What is Coroutine")
        local w = coroutine.yield("2")
        print(p)
        local e = coroutine.yield("3")
        for i = 1, 5 do
            print("coroutine loop")
        end
        local r = coroutine.yield("4")
    end
)

local s, v = coroutine.resume(newcoroutine)
print(s, v)
local s, v = coroutine.resume(newcoroutine)
print(s, v)
local s, v = coroutine.resume(newcoroutine, "Value?")
print(s, v)
coroutine.resume(newcoroutine)
coroutine.resume(newcoroutine)