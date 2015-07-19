Template.trash.helpers
  notes: ->
    Notes.find({"trash": true})
