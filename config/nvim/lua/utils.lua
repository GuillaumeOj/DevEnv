function _G.lsp_clients_list_as_string()
	local clients = vim.lsp.get_active_clients({ bufnr = 0 })
	if #clients == 0 then
		return "LSP Inactive"
	end

	local buf_filetype = vim.bo.filetype
	local client_names = {}

	for _, client in pairs(clients) do
		table.insert(client_names, client.name)
	end

	local formatters = require("formatter.config").formatters_for_filetype(buf_filetype)
	for _, formatter_config in ipairs(formatters) do
		local formatter
		if type(formatter_config) == "table" then
			formatter = formatter_config
		else
			formatter = formatter_config()
		end
		if formatter and formatter.exe then
			table.insert(client_names, formatter.exe)
		end
	end

	local lint_s, lint = pcall(require, "lint")
	if lint_s then
		for ft_k, ft_v in pairs(lint.linters_by_ft) do
			if type(ft_v) == "table" then
				for _, linter in ipairs(ft_v) do
					if buf_filetype == ft_k then
						table.insert(client_names, linter)
					end
				end
			elseif type(ft_v) == "string" then
				if buf_filetype == ft_k then
					table.insert(client_names, ft_v)
				end
			end
		end
	end

	local unique_client_names = {}
	for _, client_name in ipairs(client_names) do
		local is_duplicate = false
		for _, client_name_compare in ipairs(unique_client_names) do
			if client_name == client_name_compare then
				is_duplicate = true
			end
		end
		if not is_duplicate then
			table.insert(unique_client_names, client_name)
		end
	end

	local client_names_str = table.concat(unique_client_names, ", ")
	local language_servers = string.format("[%s]", client_names_str)

	return language_servers
end
