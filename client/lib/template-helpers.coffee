Template.registerHelper "equals", (param1,param2)->
  if param1 is param2
    return true
  else
    return false

Template.registerHelper "noteTodos", (noteId)->
    Todos.find({noteId: noteId})
