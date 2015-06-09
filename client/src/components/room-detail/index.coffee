_      = require 'lodash'
React  = require 'react'
jade   = require 'react-jade'
{Link} = require 'react-router'

template = jade.compile '''
.js-room-detail
  | here detail of
  span= name
  |\'s room (
  span= id
  | )
  Link(to="plans", params={roomId: id}) plans
'''
module.exports = React.createClass
  getInitialState: ->
    id: 'id'
    name: 'name'
    administrator: 'admin'
  render: ->
    template _.extend {}, @, @props, @state
    
