Dispatcher    = require '../dispatcher/app-dispatcher'
{ActionTypes} = require '../constants/room-constants'
WebApiUtil    = require '../utils/web-api-utils'

module.exports = ->

  Dispatcher.dispatch
    type: ActionTypes.RECEIVE_ALL_ROOMS_START

  WebApiUtil.getAllRooms()
