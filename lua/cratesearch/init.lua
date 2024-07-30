local T = {}

T.setup = function(opts)
	local config = opts or {}

	if config.enable == nil or config.enable == false then
		local search_crate = function(query)
			local query = query.args
			local lines = { "Search results for " .. query }
			local i = 2
			if query ~= "" then
				local json_data =
					vim.json.decode(vim.fn.system("curl -s 'https://crates.io/api/v1/crates?q=" .. query .. "'"))

				local crates = json_data.crates

				for pos, data in pairs(crates) do
					lines[i] = "["
						.. pos
						.. "] "
						.. data.name:gsub("[\n\r]", " ")
						.. ": "
						.. data.description:gsub("[\n\r]", " ")
						.. " Downloads: "
						.. data.downloads

					i = i + 1
				end

				local editor_width = vim.o.columns
				local editor_height = vim.o.lines

				local width = editor_width - 4
				local height = 11

				if width > 0 and height > 10 then
					local row = (editor_height - height) / 2
					local col = (editor_width - width) / 2

					local options = {
						height = height,
						width = width,
						row = row,
						col = col,
						style = "minimal",
						border = "rounded",
						relative = "editor",
					}

					local buf = vim.api.nvim_create_buf(false, false)

					vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines)

					vim.api.nvim_open_win(buf, true, options)

					vim.bo.modifiable = false
				else
					print("Failed to construct window!")
				end
			end
		end

		vim.api.nvim_create_user_command("CrateSearch", search_crate, {
			nargs = 1,
			bang = false,
		})
	end
end

return T
