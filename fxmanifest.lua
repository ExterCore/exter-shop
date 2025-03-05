fx_version 'cerulean'
game 'gta5'
lua54 "yes"
author 'sobing'

version '1.3'

decription 'exter-shop like nopixel 4.0'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/index.js',
  'html/style.css',
  'html/*otf',
  'html/*png',
  'fonts/*.ttf',
  'fonts/*.otf'
 
}

client_scripts{
  'client/*.lua',
}

shared_scripts {
	'shared/cores.lua',
  'shared/config.lua'
}

server_scripts {
  'server/*.lua',
}
