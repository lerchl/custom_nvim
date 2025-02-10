local gitblame = require("gitblame")

gitblame.setup {
    display_virtual_text = false,
    date_format = "%r",
	message_when_not_committed = "uncommitted"
}
