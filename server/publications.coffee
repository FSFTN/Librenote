Meteor.publish "allNotes",(searchValue) ->
  if searchValue is ""
    Notes.find({owner: @userId}, {sort: {createdAt: -1}})
  else
    cursor = Notes.find(
      { $text: {$search: searchValue} },
      {
        fields: {
          score: { $meta: "textScore" }
        },
        sort: {
          score: { $meta: "textScore" }
        }
      }
    )
    cursor

Meteor.publish "editTodo", (noteId)->
  if noteId
    Todos.find({noteId: noteId, owner: @userId})

Meteor.publish "allTodos",->
  Todos.find({owner: @userId})
