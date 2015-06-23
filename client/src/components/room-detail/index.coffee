_      = require 'lodash'
React  = require 'react'
jade   = require 'react-jade'
{Link} = require 'react-router'
RoomStore = require '../../stores/room-store'

# TODO ルーティングのアクションについては再考
clickRoom = require '../../actions/click-room'

template = jade.compile '''
.js-room-detail
  div
    | name: 
    span= state.name
    | (
    span= state.id
    | ) 
  div the administrator is
    span= state.administrator
  div
    span= state.comment
  div
    Link(to="plans", params={roomId: props.params.roomId}) see Plans

'''

getStateFromStore = ->
  current = RoomStore.getCurrent()
  s =
    id            : current.id
    name          : current.name
    administrator : current.administrator
    comment       : current.comment
  s

module.exports = React.createClass

  getInitialState: ->
    id: @props.params.roomId
    name: null
    administrator: null
    comment: null

  componentDidMount: ->
    RoomStore.addChangeListener @_onChange
    clickRoom @props.params.roomId

  componentWillUnmount: ->
    RoomStore.removeChangeListener @_onChange

  _onChange: ->
    @setState getStateFromStore()

  render: ->
    template _.extend {}, @

