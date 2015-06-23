Dispatcher    = require '../dispatcher/app-dispatcher'
{ActionTypes} = require '../constants/room-constants'
WebApiUtil    = require '../utils/web-api-utils'

module.exports = (roomName) ->

  Dispatcher.dispatch
    type: ActionTypes.CREATE_ROOM_START
    name: roomName

  WebApiUtil.createRoom roomName
