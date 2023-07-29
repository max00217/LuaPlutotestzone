function energyFunction(x, y)
    return x^2 + ((y - 3)^2) / 2
end

local function greedyOptimization(iterations, step)
    local x = 0.0
    local y = 0.0

    for i = 1, iterations do
        local currentEnergy = energyFunction(x, y)
        local leftEnergy = energyFunction(x - step, y)
        local rightEnergy = energyFunction(x + step, y)
        local upEnergy = energyFunction(x, y + step)
        local downEnergy = energyFunction(x, y - step)

        local minEnergy = math.min(currentEnergy, leftEnergy, rightEnergy, upEnergy, downEnergy)

        if minEnergy == leftEnergy then
            x = x - step
        elseif minEnergy == rightEnergy then
            x = x + step
        elseif minEnergy == upEnergy then
            y = y + step
        else
            y = y - step
        end
    end

    return {x, y, energy=energyFunction(x, y)}
end

local function processAndPrint(optLevel, iterations, step)
    local result = greedyOptimization(iterations, step)
    print(optLevel .. ": " .. result.energy .. ", x: " .. result[1] .. ", y: " .. result[2])
end

local iterations = {28, 29, 30}
local step = 0.1

processAndPrint("28 Iterations", iterations[1], step)
processAndPrint("29 Iterations", iterations[2], step)
processAndPrint("30 Iterations", iterations[3], step)
