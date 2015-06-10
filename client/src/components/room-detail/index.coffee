_      = require 'lodash'
React  = require 'react'
jade   = require 'react-jade'
{Link} = require 'react-router'
superagent = require 'superagent'

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
module.exports = React.createClass

  getInitialState: ->
    id: @props.params.roomId
    name: null
    administrator: null
    comment: null

  componentDidMount: ->
    superagent
      .get '/api/rooms/' + @props.params.roomId
      .end (err, res)=>
        @setState JSON.parse res.text

  render: ->
    template _.extend {}, @
    
