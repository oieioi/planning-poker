RoomStore     = require '../stores/room-store'
{ActionTypes} = require '../constants/room-constants'

module.exports = (context, payload, done) ->
  roomStore = context.getStore RoomStore
  roomId = payload.roomId
  context.dispatch 'CLICK_ROOM_START', roomId
  superagent.get '/api/rooms/' + roomId
    .end (err, res)->

      if err
        context.dispatch 'CLICK_ROOM_FAILURE', roomId
        done()
        return

      context.dispatch 'CLICK_ROOM_SUCCESS', roomId
      done()

