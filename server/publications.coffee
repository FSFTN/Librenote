Meteor.publish "notes",(searchValue) ->
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

Meteor.publish "todos",(searchValue)->
  if searchValue is ""
    Todos.find({owner: @userId})
  else
    #fetch all the notes with the search query and get the noteId of each result
    todoIds = Todos.find(
      { $text: {$search: searchValue} },
      {
        fields: {
          score: { $meta: "textScore" }
          noteId: 1
        },
        sort: {
          score: { $meta: "textScore" }
        }
      }
    ).map((todo)-> todo.noteId)

   #get all the notes with the obtained ids
    notes = Notes.find({_id: {$in: todoIds}})

    noteIds = notes.map((note)-> note._id)
    todos = Todos.find({noteId: {$in: noteIds}})
    return [
      notes
      todos
    ]

