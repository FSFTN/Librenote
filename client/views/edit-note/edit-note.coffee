Template.editNote.helpers
  activeNote: ->
    Session.get "editNote"

  editNoteColor:()->
    color = Session.get "editNoteColor"
    console.log color
    data = Session.get "editNote"
    if color is ""
      data.color
    else
      color

Template.editNote.events
  "click #btn-done":(e,t) ->
    title = t.$('#title').val().trim()
    content = $('#edit-note-content').text().trim()
    currentData = Session.get "editNote"
    selectedColor = Session.get "editNoteColor"
    if selectedColor isnt ""
      color = selectedColor
    else
      color =  currentData.color
    console.log color
    if title or content
      data = {
        title: title
        content: content
        type: "text"
        color: color 
        trash: false
        date: Date.now()
        owner: Meteor.userId()
      }
      console.log data
      Notes.update({_id: @._id}, {$set: data})
      $('#edit-modal').closeModal()

    	
  "click .colors-container a":(e,t)->
    color = $(e.currentTarget).attr('data-color').trim()
    Session.set "editNoteColor", color


