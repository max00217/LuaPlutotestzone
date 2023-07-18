local players = {"mumu", "kai", "mine", "soe", "poe"}
local callings = "mumu"

function table.indexOf(t, value)
    for i, v in ipairs(t) do
        if v == value then
            return i
        end
    end
    return nil
end
