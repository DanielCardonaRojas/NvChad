local opt = vim.opt
local M = {}

local g = vim.g
g.ultest_running_sign = "喇"
g.ultest_pass_sign = ""
g.ultest_not_run_sign = ""
g.ultest_fail_sign = ""
g.ultest_use_pty = 0
g.ultest_summary_width = 55
-- ['test#javascript#reactscripts#options'] = "--watchAll=false"

function M.configure()
    local builders = {
        dart = function(cmd)
          -- print(unpack(cmd))
          -- print("Testing: " .. cmd[4])
          return {
            dap = {
              type = "dart_test",
              request = "launch",
              name = "Debug test",
              dartSdkPath = os.getenv('HOME').."/fvm/default/bin/cache/dart-sdk/",
              flutterSdkPath = os.getenv('HOME').."/fvm/default/",
              program = "${file}",
              args = {'--plain-name', cmd[4]}
            },
            parse_result = function(lines)
              print(unpack(cmd))
              local isEmpty = next(lines) == nil
              return isEmpty and 0 or 1
            end
          }
        end,
        python = function(cmd)
            local non_modules = {"python", "pipenv", "poetry"}

            local module_index
            if vim.tbl_contains(non_modules, cmd[1]) then
                module_index = 3
            else
                module_index = 1
            end

            local args = vim.list_slice(cmd, module_index + 1)

            return {
                dap = {
                    type = "python",
                    name = "Ultest Debugger",
                    request = "launch",
                    module = cmd[module_index],
                    args = args,
                    justMyCode = false
                }
            }
        end,
    }
    require("ultest").setup({builders = builders})
end

return M
