local dap = require("dap")
local repl = require("dap.repl")

dap.adapters["probe-rs-debug"] = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.expand("$HOME/.cargo/bin/probe-rs"),
        args = { "dap-server", "--port", "${port}" },
    },
}

require("dap.ext.vscode").type_to_filetypes["probe-rs-debug"] = { "rust" }

dap.listeners.before["event_probe-rs-rtt-channel-config"]["my-rtt-handler"] = function(session, body)
    session:request("rttWindowOpened", { body.channelNumber, true })
end

dap.listeners.before["event_probe-rs-rtt-data"]["my-rtt-handler"] = function(_, body)
    local line = body.data:gsub("%s+$", "")
    repl.append(line)
end

dap.listeners.before["event_probe-rs-show-message"]["my-rtt-handler"] = function(_, body)
    vim.notify(body.message, vim.log.levels.INFO)
end
