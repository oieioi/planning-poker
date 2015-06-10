express = require 'express'
router = express.Router()

router.get '/', (req, res, next) ->
  res.send [
    {id: 1, name: 'name1', administrator: 'a1'}
    {id: 2, name: 'name2', administrator: 'a2'}
    {id: 3, name: 'name3', administrator: 'a3'}
    {id: 4, name: 'name4', administrator: 'a4'}
    {id: 5, name: 'name5', administrator: 'a5'}
  ]

router.get '/:roomId', (req, res, next) ->
  roomId = req.params.roomId
  res.send
    id: roomId
    name: "#{roomId}'s room <3"
    administrator: "admin #{roomId}"
    other: 'hoge'

module.exports = router
