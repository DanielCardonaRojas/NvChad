local M = {}
local dap = require('dap')

local setupAdapters = function()
  dap.adapters.dart = {
    type = "executable",
    command = "dart",
    args = {"debug_adapter"}
  }

  dap.adapters.dart_test = {
    type = "executable",
    command = "dart",
    args = {"debug_adapter", "--test"}
  }

  dap.adapters.flutter = {
    type = "executable",
    command = "flutter",
    args = {"debug_adapter"},
    options = {
      initialize_timeout_sec = 10,
    },
  }

end

local setupConfigurations = function()
  dap.configurations.dart = {
    {
      type = "flutter",
      request = "launch",
      name = "Launch Flutter (fvm)",
      dartSdkPath = os.getenv('HOME').."/fvm/default/bin/cache/dart-sdk/",
      flutterSdkPath = os.getenv('HOME').."/fvm/default/",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
    },
    {
      type = "flutter",
      request = "attach",
      name = "Connect Flutter (fvm)",
      dartSdkPath = os.getenv('HOME').."/fvm/default/bin/cache/dart-sdk/",
      flutterSdkPath = os.getenv('HOME').."/fvm/default/",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
    },
    {
      type = "dart",
      request = "launch",
      name = "Launch Dart (fvm)",
      dartSdkPath = os.getenv('HOME').."/fvm/default/bin/cache/dart-sdk/",
      program = "${file}",
    },
    {
      type = "dart_test",
      request = "launch",
      name = "Test Dart (fvm)",
      dartSdkPath = os.getenv('HOME').."/fvm/default/bin/cache/dart-sdk/",
      program = "${file}",
    }
  }
end

M.configure = function()
  setupAdapters()
  setupConfigurations()
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = 'DiagnosticHint', linehl = "", numhl = "" })
  vim.fn.sign_define('DapBreakpointRejected', {text='', texthl= '', linehl='', numhl=''})
  vim.fn.sign_define("DapStopped", { text = "", texthl = 'DiagnosticInformation', linehl = "", numhl = "" })
end

M.setupAdapters = setupAdapters
M.setupConfigurations = setupConfigurations

return M

