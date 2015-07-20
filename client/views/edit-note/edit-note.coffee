Template.editNote.helpers
  activeNote: ->
    Session.get "editNote"

Template.editNote.events
  "click #btn-done":(e,t) ->
    title = t.$('#title').val().trim()
    content = $('#edit-note-content').text().trim()
    currentData = Session.get "editNote"
    if title or content
      data = {
        title: title
        content: content
        type: "text"
        color: currentData.color
        trash: false
        date: Date.now()
        owner: Meteor.userId()
      }
      Notes.update({_id: @._id}, {$set: data})
      $('#edit-modal').closeModal()

    	
  "click .colors-container a":(e,t)->
    color = $(e.currentTarget).attr('data-color').trim()
    data = Session.get "editNote"
    data.color = color
    Session.set "editNote", data


