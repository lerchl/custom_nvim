local M = {}

function M.filter_table(t, f)
	local filtered = {}
	for i, e in ipairs(t) do
		if f(e) then
			table.insert(filtered, e)
		end
	end
	return filtered
end

return M

