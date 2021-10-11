resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

version '5.0'

description 'NUBdev MinigameCard'

ui_page {
  './ui/index.html'
}

files {
  './ui/index.html',
  './ui/style.css',
  './ui/script.js',
  './ui/*',
}

client_scripts {
  '@es_extended/locale.lua',
  --'warmenu.lua',
  'config.lua',
  'client.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'server.lua'
}	
