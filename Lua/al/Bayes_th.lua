function probability_of_red_and_blue_balls()
    local red_balls = 8
    local blue_balls = 2
    local total_balls = red_balls + blue_balls

    local P_red_first = red_balls / total_balls

    total_balls = total_balls - 1
    red_balls = red_balls - 1

    local P_blue_second_given_red_first = blue_balls

    local P_red_first_and_blue_second = P_red_first * P_blue_second_given_red_first
    return ((5*P_red_first_and_blue_second).."/"..(5*total_balls))
end

local result = probability_of_red_and_blue_balls()
print("result: " .. result)
