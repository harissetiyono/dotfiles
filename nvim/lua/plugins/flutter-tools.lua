return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      local home_path = os.getenv("HOME")
      local personal_project_path = os.getenv("PERSONAL_PROJECT_PATH")
      local jds_project_path = os.getenv("JDS_PROJECT_PATH")
      local dap = require("dap")

      require("flutter-tools").setup({
        debugger = {
          enabled = true,
          run_via_dap = true,
          exception_breakpoints = {},
          register_configurations = function(_)
            dap.adapters.dart = {
              type = "executable",
              command = "fvm",
              args = { "flutter", "debug_adapter" },
            }

            dap.configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Counter App",
                dartSdkPath = home_path .. "/fvm/versions/stable/bin/cache/dart-sdk/",
                flutterSdkPath = home_path .. "/fvm/versions/stable",
                program = "${workspaceFolder}/lib/main_development.dart",
                cwd = "${workspaceFolder}",
                args = { "--flavor", "development" },
              },
              {
                type = "dart",
                request = "launch",
                name = "[Example] Neo UI",
                dartSdkPath = home_path .. "/fvm/versions/3.24.4/bin/cache/dart-sdk/",
                flutterSdkPath = home_path .. "/fvm/versions/3.24.4",
                program = personal_project_path .. "/afterfive_monorepo/packages/neo_ui/example/lib/main.dart",
                args = { "-d", "chrome" },
              },
            }
            -- uncomment below line if you've launch.json file already in your vscode setup
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        fvm = true,
        closing_tags = {
          highlight = "ErrorMsg", -- highlight for the closing tag
          prefix = ">", -- character to use for close tag e.g. > Widget
          priority = 10, -- priority of virtual text in current line
          -- consider to configure this when there is a possibility of multiple virtual text items in one line
          -- see `priority` option in |:help nvim_buf_set_extmark| for more info
          enabled = true, -- set to false to disable
        },
        dev_log = {
          enabled = true,
          filter = nil, -- optional callback to filter the log
          -- takes a log_line as string argument; returns a boolean or nil;
          -- the log_line is only added to the output if the function returns true
          notify_errors = true, -- if there is an error whilst running then notify the user
          open_cmd = "15vnew", -- command to use to open the log buffer
          focus_on_open = true, -- focus on the newly opened log window
        },
        outline = {
          open_cmd = "30vnew", -- command to use to open the outline buffer
          auto_open = false, -- if true this will open the outline automatically when it is first populated
        },
      }) -- use defaults

      require("telescope").load_extension("flutter")
    end,
  },
}
