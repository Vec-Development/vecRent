fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*'
}

client_scripts {
    'client/*',
    'shared/*'
}

server_scripts {
    'server/*',
    'shared/*'
}