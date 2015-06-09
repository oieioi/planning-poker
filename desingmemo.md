Front end routings
==================

## /login

input user name (need not input password)

## /rooms

select rooms

## /rooms/new

create room

## /rooms/{roomId}

join the room

Back end routings (RESTful, but implement with websocket...)
=================

## /sessions

- POST /sessions
    - name

## /rooms

- POST /rooms
    - name
- GET /rooms
- GET /rooms/{roomId}
    - plans
        - max
        - min
        - result
        - entries
            - [{"member": "memberName", "value": 1}, ...]
    - admin
    - members

## /rooms/{roomID}/members

- POST /rooms/{roomId}/members
   - join the room
- DELETE /rooms/{roomId}/members/{memberId}
   - get out the room

## /rooms/{roomID}/plans

- POST /rooms/{roomID}/plans
- POST /rooms/{roomID}/plans/{planId}/entries
- GET  /rooms/{roomId}/plans/{planId}/result
- POST /rooms/{roomId}/plans/{planId}/result
   - close planning
