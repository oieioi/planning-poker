Dispatcher    = require '../dispatcher/app-dispatcher'
{ActionTypes} = require '../constants/room-constants'
WebApiUtil    = require '../utils/web-api-utils'

module.exports = (roomId) ->

  Dispatcher.dispatch
    type: ActionTypes.CLICK_PLAN
    roomId: roomId

  WebApiUtil.getPlan roomId
