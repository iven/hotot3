'use strict'

###
Reload client for Chrome Apps & Extensions.
The reload client has a compatibility with livereload.
WARNING: only supports reload command.
###

LIVERELOAD_HOST = 'localhost:'
LIVERELOAD_PORT = 35729
LIVERELOAD_ADDR = 'ws://' + LIVERELOAD_HOST + LIVERELOAD_PORT + '/livereload'

connection = new WebSocket(LIVERELOAD_ADDR)

connection.onerror = (e) ->
  console.log('reload connection got error' + JSON.stringify(e))

connection.onmessage = (e) ->
  if e.data
    data = JSON.parse(e.data)
    if data and data.command == 'reload' then chrome.runtime.reload()
