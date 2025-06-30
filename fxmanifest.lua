fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name         'dude_consumables'
version      '1.0.0'
description  'Consumable items script for Y2K era realistic server'
author       'Original by Pickle Mods, Modified for Dude RP'

ui_page "nui/index.html"

files {
    "nui/index.html",
    "nui/assets/**/*.*",
    'locales/*.json'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua',
    'core/shared.lua',
    "locales/*.lua",
    'modules/**/shared.lua',
    'bridge/**/shared.lua',
	'modules/alcohol/shared.lua',
}

server_scripts {
    'bridge/**/server.lua',
    'modules/**/server.lua',
	'modules/alcohol/server.lua',
}

client_scripts {
    'core/client.lua',
    'bridge/**/client.lua',
    'modules/**/client.lua',
	'modules/alcohol/client.lua',
}

dependencies {
    'ox_lib',
    'ox_target',
    'ox_inventory'
}