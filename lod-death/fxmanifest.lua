fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "lod#1101"


ui_page 'html/index.html'

client_scripts {
  'client.lua',
  "config.lua",
}

server_scripts {

  'server.lua',
}

files {
  'html/main.js',
  'html/style.css',
  'html/fonts/*.otf',
  'html/images/overlay.png',
  'html/index.html'
}

dependencies {
	'es_extended'
}

escrow_ignore {
  'html/index.html',
  'html/style.css',
  "config.lua",
}