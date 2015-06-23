_     = require 'lodash'
React = require 'react'
jade  = require 'react-jade'
ListItem    = require './list-item'
RoomStore   = require '../../stores/room-store'
getAllRooms = require '../../actions/get-all-rooms'
createRoom  = require '../../actions/create-room'

template = jade.compile("""
  div#rooms-component
    h2 rooms
    div
      label
        | name:
        input(type='text'
              placeholder='room name'
              value=state.newRoomName
              onChange=changeRoomName)
      button.js-btn-create(onClick=createRoom)
        | create room dayo
    ul
      = items
""")

itemTemplate = jade.compile("""
  li(key=item.id)
    ListItem(id=item.id, name=item.name, administrator=item.administrator)
""")

getStateFromStore = ->
  newRoomName: ''
  list: RoomStore.getAll()

module.exports = React.createClass
  getInitialState: ->
    newRoomName: ''
    list: []

  componentDidMount: ->
    RoomStore.addChangeListener @_onChange
    # TODO here?
    getAllRooms()

  componentWillUnmount: ->
    RoomStore.removeChangeListener @_onChange

  _onChange: ->
    @setState getStateFromStore()

  createRoom: ->
    createRoom(@state.newRoomName)

  changeRoomName: (e)->
    @setState newRoomName: e.target.value

  render: ->
    items = @state.list.map (item, i) ->
      itemTemplate ListItem: ListItem, item: item
    template
      items: items
      createRoom: @createRoom
      changeRoomName: @changeRoomName
      state: @state
