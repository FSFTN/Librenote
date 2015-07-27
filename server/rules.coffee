@Notes.allow
  insert: (userId, doc) ->
    userId and doc.owner == userId
  update: (userId, doc, fields, modifier) ->
    doc.owner == userId
  remove: (userId, doc) ->
    doc.owner == userId
  fetch: [ 'owner' ]

@Notes.deny
  update: (userId, docs, fields, modifier) ->
    _.contains(fields, 'owner')

@Todos.allow
  insert: (userId, doc) ->
    return true
  update: (userId, doc, fields, modifier) ->
    return true
  remove: (userId, doc) ->
    return true
