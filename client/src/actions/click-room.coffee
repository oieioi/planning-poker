Dispatcher    = require '../dispatcher/app-dispatcher'
{ActionTypes} = require '../constants/room-constants'
WebApiUtil    = require '../utils/web-api-utils'

module.exports = (roomId) ->

  Dispatcher.dispatch
    type: ActionTypes.CLICK_ROOM
    roomId: roomId

  WebApiUtil.getRoom roomId
  WebApiUtil.getAllPlans roomId
