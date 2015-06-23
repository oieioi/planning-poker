sqlite3 = require('sqlite3').verbose()

db = new sqlite3.Database ':memory:'
db.serialize ->
  db.run 'CREATE TABLE room (
    name TEXT
    , administrator interger
  )'
  db.run 'CREATE TABLE plan (
    name TEXT
    , roomid interger
    , state TEXT
    , max interger
    , min interger
  )'
  stmt = db.prepare 'insert into room values (?, ?)'
  [1...10].forEach (i) ->
    stmt.run "hoge #{i}", i
  stmt.finalize()
  stmt = db.prepare 'insert into plan values (?, ?, ?, ?, ?)'
  [1...10].forEach (i) ->
    stmt.run "plan #{i}", 0, 'open', 5, 10

module.exports = db
