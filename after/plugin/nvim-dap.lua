local dap = require('dap')
local dapui = require('dapui')
local dap_python = require('dap-python')
local dap_virtual_text = require('nvim-dap-virtual-text')

dapui.setup {}
dap_virtual_text.setup {
    enabled = true,
    enabled_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = true,
    only_first_definition = true,
}

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb",
}

-- Setup debugging for C, C++, and Rust
local lldb = {
    name = "Launch lldb",
    type = "lldb",              -- matches the adapter
    request = "launch",
    program = function()
        return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
        )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
}

dap.configurations.rust = { lldb }
dap.configurations.c = { lldb }
dap.configurations.cpp = { lldb }



-- Setup debugging for JS
require('dap-vscode-js').setup {
    debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug",
    adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node' },
}

-- Setup debugging for Python
dap_python.setup( '~/.virtualenvs/debugpy/bin/python' )


vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<leader>dB', function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set breakpoint with a condition" })
vim.keymap.set('n', "<F5>", function() dap.continue() end, { desc = "Continue" })
vim.keymap.set('n', "<F9>", function() dap.step_back() end, { desc = "Step Back" })
vim.keymap.set('n', "<F10>", function() dap.step_into() end, { desc = "Step Into" })
vim.keymap.set('n', "<F11>", function() dap.step_out() end, { desc = "Step Out" })
vim.keymap.set('n', "<F12>", function() dap.step_over() end, { desc = "Step Over" })
vim.keymap.set('n', "<leader>dq", function()
    dap.terminate()
    dapui.close()
    vim.cmd('DapVirtualTextForceRefresh')
end, { desc = "Quit" })

-- Toggle debugging window
vim.keymap.set('n', "<leader>dd", function() dapui.toggle() end, { desc = "Open the debugging window" })


