local M = {}

M.capitalize = function(str)
    return (str:gsub("^%l", string.upper))
end

return M
