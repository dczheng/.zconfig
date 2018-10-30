
config.set( 'qt.force_software_rendering', 'chromium' )
config.set( 'url.default_page', 'https://dczheng.github.io' )
config.set( 'url.start_pages', 'https://dczheng.github.io' )

config.bind( '<Ctrl-p>', 'set content.proxy socks://debian-wlan:8021' )
config.bind( '<Ctrl-Shift-p>', 'config-unset content.proxy' )

config.bind( '<Ctrl-i>', 'set colors.webpage.bg black' )
config.bind( '<Ctrl-Shift-i>', 'set colors.webpage.bg white' )

config.bind( '<Ctrl-Shift-g>', 'open -t www.google.com' )
