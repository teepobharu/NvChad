local M = {}

M.combine_dicts = function(...)
    local combined_dict = {}
    local dicts = {...}

    for _, dict in ipairs(dicts) do
        combined_dict = vim.tbl_extend("keep", combined_dict, dict)
    end

    return combined_dict
end

return M
