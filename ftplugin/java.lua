-- Must change for each project 
local workspace_dir = "/Users/brandonwong/iCloud Drive (Archive)/Documents/Git/"
local capabilities = vim.lsp.protocol.make_client_capabilities()

local lombok_version = ''
local lombok_jar = '$HOME/Users/brandonwong/Downloads/lombok.jar'

local is_file_exist = function(path)
  local f = io.open(path, 'r')
  return f ~= nil and io.close(f)
end

local get_lombok_javaagent = function()
  if is_file_exist(lombok_jar) then
    return string.format('--jvm-arg=-javaagent:%s', lombok_jar)
  end
end

local get_lombok_bootclasspath = function()
  if is_file_exist(lombok_jar) then
    return string.format('--jvm-arg=-Xbootclasspath/a:%s', lombok_jar)
  end
end


local config= {
  cmd = {
    'java', '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-javaagent:/Users/brandonwong/.config/nvim/lombok.jar',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-Xmx2G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',


    '-jar', '/Users/brandonwong/Downloads/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

    '-configuration', '/Users/brandonwong/Downloads/jdt-language-server-1.9.0-202203031534/config_mac/',
    '-data', workspace_dir,
    },
    settings = {
      java = {
      }
    },
    init_options = {
      bundles = {}
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  }
config.settings = {
    java = {
      project = {
        referencedLibraries = {
          '/Users/brandonwong/.config/nvim/lombok.jar',
        },
      }
    }
  }
require'lspconfig'.gradle_ls.setup{
  cmd = {
    "gradle-language-server", "/Users/brandonwong/.config/nvim/vscode-gradle/gradle-language-server"
  },
  filetypes = {
    "gradle"
  }
}
require'lspconfig'.html.setup {}
require('jdtls').start_or_attach(config)
require'lspconfig'.html.setup{}
require'lspconfig'.cssmodules_ls.setup{}
