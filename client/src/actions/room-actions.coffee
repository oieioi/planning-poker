Dispatcher     = require '../dispatcher/app-dispatcher'
{ActionTypes}  = require '../constants/room-constants'

RoomActions =
  clickRoom: (roomId) ->
    Dispatcher.dispatch
      type: ActionTypes.CLICK_ROOM
      roomId: roomId
