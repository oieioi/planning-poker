Dispatcher     = require '../dispatcher/app-dispatcher'
{ActionTypes}  = require '../constants/room-constants'
superagent     = require 'superagent'

module.exports = ->

  Dispatcher.dispatch
    type: ActionTypes.RECEIVE_ALL_ROOMS_START

  superagent.get '/api/rooms'
    .end (err, res)->

      if err
        Dispatcher.dispatch
          type: ActionTypes.RECEIVE_ALL_ROOMS_FAILURE
        return

      Dispatcher.dispatch
        type: ActionTypes.RECEIVE_ALL_ROOMS_SUCCESS
        rooms: JSON.parse res.text

