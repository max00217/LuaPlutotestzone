---@diagnostic disable: undefined-global
local gridSize = 3
local cellSize = 190
local grid = {}
local clicktime = 0
local WhoWin = ""

function love.load()
    love.window.setMode(571, 600)
    love.window.setTitle("오량인의 성능 안 좋은 TicTacToe")
    love.graphics.setBackgroundColor(0.9, 0.8, 0.8)
    for row = 1, gridSize do
        grid[row] = {}
        for col = 1, gridSize do
            grid[row][col] = 0
        end
    end
    pause = false
    local font = love.graphics.newFont("BMDOHYEON.ttf", 200)
    love.graphics.setFont(font)
end

function love.update(dt)
    local Draw = true
    if not WinCheck() then
        for i = 1, 3 do
            for j = 1, 3 do
                if grid[i][j] == 0 then
                    Draw = false
                    break
                end
            end
            if not Draw then
                break
            end
        end
    else
        Draw = false
    end
    if Draw then
        WhoWin = "Draw"
    end
    if love.keyboard.isDown("r") then
        love.load()
        WhoWin = ""
    end
end

function love.mousepressed(x, y, button)
    if x <= gridSize * cellSize and y <= gridSize * cellSize and WhoWin == "" then
        local clickedColumn = math.floor(x / cellSize) + 1
        local clickedRow = math.floor(y / cellSize) + 1
        if button == 1 then
            if grid[clickedRow][clickedColumn] == 0 then
                clicktime = clicktime + 1
                if clicktime % 2 == 1 then
                    grid[clickedRow][clickedColumn] = 1
                else
                    grid[clickedRow][clickedColumn] = 2
                end
            end
        end
    end
end

function WinCheck()
    if
    (grid[1][1] == 1 and grid[1][2] == 1 and grid[1][3] == 1) or
    (grid[2][1] == 1 and grid[2][2] == 1 and grid[2][3] == 1) or
    (grid[3][1] == 1 and grid[3][2] == 1 and grid[3][3] == 1) or
    (grid[1][1] == 1 and grid[2][1] == 1 and grid[3][1] == 1) or
    (grid[1][2] == 1 and grid[2][2] == 1 and grid[3][2] == 1) or
    (grid[1][3] == 1 and grid[2][3] == 1 and grid[3][3] == 1) or
    (grid[1][1] == 1 and grid[2][2] == 1 and grid[3][3] == 1) or
    (grid[1][3] == 1 and grid[2][2] == 1 and grid[3][1] == 1) then
        WhoWin = "O Wins"
    elseif
    (grid[1][1] == 2 and grid[1][2] == 2 and grid[1][3] == 2) or
    (grid[2][1] == 2 and grid[2][2] == 2 and grid[2][3] == 2) or
    (grid[3][1] == 2 and grid[3][2] == 2 and grid[3][3] == 2) or
    (grid[1][1] == 2 and grid[2][1] == 2 and grid[3][1] == 2) or
    (grid[1][2] == 2 and grid[2][2] == 2 and grid[3][2] == 2) or
    (grid[1][3] == 2 and grid[2][3] == 2 and grid[3][3] == 2) or
    (grid[1][1] == 2 and grid[2][2] == 2 and grid[3][3] == 2) or
    (grid[1][3] == 2 and grid[2][2] == 2 and grid[3][1] == 2) then
        WhoWin = "X Wins"
    end
end

function love.draw()
    for row = 1, gridSize do
        for col = 1, gridSize do
            local x = (col - 1) * cellSize
            local y = (row - 1) * cellSize
            love.graphics.rectangle('line', x, y, cellSize, cellSize)

            if grid[row][col] == 1 then                
                love.graphics.print("O", x + cellSize / 2 - 67, y + cellSize / 2 - 105)
            elseif grid[row][col] == 2 then
                love.graphics.print("X", x + cellSize / 2 - 67, y + cellSize / 2 - 105)
            end
        end
    end
    love.graphics.print(WhoWin, 10, 570, 0, 0.1)
    love.graphics.print("Press R to Restart", 360, 570, 0, 0.1)
end