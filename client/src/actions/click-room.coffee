Dispatcher    = require '../dispatcher/app-dispatcher'
{ActionTypes} = require '../constants/room-constants'
superagent    = require 'superagent'

module.exports = (roomId) ->
  Dispatcher.dispatch
    type: ActionTypes.CLICK_ROOM
    roomId: roomId

  # TODO move to `utils`?
  superagent
    .get '/api/rooms/' + roomId
    .end (err, res)->

      if err
        Dispatcher.dispatch
          type: ActionTypes.RECEIVE_ROOM_FAILURE
          roomId: roomId
        return

      Dispatcher.dispatch
        type: ActionTypes.RECEIVE_ROOM_SUCCESS
        roomId: roomId
        room: JSON.parse res.text
