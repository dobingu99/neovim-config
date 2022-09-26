-- Must change for each project 
local workspace_dir = "/Users/brandonwong/iCloud Drive (Archive)/Documents/Git/"
local capabilities = vim.lsp.protocol.make_client_capabilities()

local config= {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
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
require('jdtls').start_or_attach(config)
