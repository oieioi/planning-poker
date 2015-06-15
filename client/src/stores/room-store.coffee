{createStore}  = require 'fluxible/addons'
{ActionTypes}  = require '../constants/room-constants'

_rooms = {}

RoomStore = createStore
  storeName: 'RoomStore'
  handlers:
    "#{ActionTypes.CLICK_ROOM}": 'clickRoom'

  initialize: ->

  clickRoom: (roomId)->
    



