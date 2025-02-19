local install_path = require("mason-registry")
.get_package("sonarlint-language-server")
:get_install_path()

require("sonarlint").setup {
	server = {
		cmd = {
			vim.fn.glob(install_path .. "/sonarlint-language-server"),
			"-stdio",
			"-analyzers",
			-- paths to the analyzers you need, using those for python and java in this example
			vim.fn.glob(install_path .. "/extension/analyzers/sonarjava.jar"),
		}
	},
	filetypes = {
		"java",
	}
}
