React  = require 'react'
jade   = require 'react-jade'
_      = require 'lodash'
{Link} = require 'react-router'

module.exports = React.createClass
  getDefaultProps: ->
    id: 'id'
    name: 'initial'
    administrator: '管理者'

  render: ->
    jade.compile("""
      li
        Link(to='room-detail', params={roomId: props.id})
          .js-id= props.id
          .js-name= props.name
          .js-administrator= props.administrator
    """)(_.extend {}, @, @props, @states)
