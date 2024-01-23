require("auto-session").setup({
	log_level = "error",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = true,
	-- This should be deleted in the future
	auto_session_last_session_dir = "",
})
