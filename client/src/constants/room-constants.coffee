keyMirror = require 'react/lib/keyMirror'

module.exports =
  ActionTypes: keyMirror
    GET_ALL_ROOMS                  : null
    RECEIVE_ALL_ROOMS_START        : null
    RECEIVE_ALL_ROOMS_FAILURE      : null
    RECEIVE_ALL_ROOMS_SUCCESS      : null
    CLICK_ROOM                     : null
    RECEIVE_ROOM_FAILURE           : null
    RECEIVE_ROOM_SUCCESS           : null
    CLICK_PLAN                     : null
    RECEIVE_PLAN_ALL_ROOMS_FAILURE : null
    RECEIVE_PLAN_ALL_ROOMS_SUCCESS : null

