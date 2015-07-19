Template.newNote.events
  "click .note-placeholder":(e,t) ->
    e.preventDefault()
    t.$('.note-placeholder').hide()
    t.$('.note-inner').show()
    t.$('#text-note').focus()

  "input #text-note, blur #text-note": (e,t)->
    text = $('#text-note').text().trim()
    if text isnt ""
      t.$('.text-placeholder').hide()
    else
      $('.text-placeholder').show()

  "click .text-placeholder": (e,t)->
    t.$('.text-placeholder').hide()
    t.$('#text-note').focus()



