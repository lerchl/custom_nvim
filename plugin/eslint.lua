require("lspconfig").eslint.setup {
	settings = {
		eslint = {
			rules = {
				customizations = {
					rule = "*",
					severity = "warn"
				}
			}
		}
	}
}

