React  = require 'react'
jade   = require 'react-jade'
_      = require 'lodash'
{Link} = require 'react-router'

template = jade.compile("""
    Link(to='room-detail', params={roomId: props.id})
      span id:
        span.js-id= props.id
        | 
      span name:
        span.js-name= props.name
        | 
      span administrator:
        span.js-administrator= props.administrator
        | 
""")

module.exports = React.createClass
  getDefaultProps: ->
    id: 'id'
    name: 'initial'
    administrator: '管理者'

  render: ->
    template _.extend {}, @, @props, @states
