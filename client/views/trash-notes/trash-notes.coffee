Template.trash.helpers
  notes: ->
    if Session.get "searchValue"
      Notes.find({trash: true, archive: false, owner: Meteor.userId()}, { sort: [["score", "desc"]] })
    else
      Notes.find({trash: true, owner: Meteor.userId(), archive: false}, {sort: {createdAt: -1}})

  noteCount: ->
    count = Notes.find({trash: true, owner: Meteor.userId()}).count()
    if count isnt 0
      true
    else
      false


Template.trash.events
  "click .btn-delete":(e,t) ->
    if confirm("Are you sure? You can not restore once deleted from trash")
      Notes.remove({_id: @._id})	

  "click .btn-restore":(e,t) ->
    Notes.update({_id: @._id}, {$set: {trash: false}})

  "click .btn-delete-all":(e,t)->
    if confirm("Are you sure? You can not restore once deleted from trash")
      Meteor.call('clearTrash', (err, res)->
        if err
          Materialize.toast(err.reason, 1500)
        else
          Materialize.toast('Notes removed permanently', 1500)

      )

  "click .select-note":(e,t)->
    e.stopPropagation()
    t.$("#"+@_id+"-trash-note").toggleClass('selected')
    noteIds = Session.get "selectedNotes"
    index = noteIds.indexOf(@_id)
    if index > -1
      noteIds.splice(index,1)
      Session.set "selectedNotes", noteIds
    else
      noteIds.push(@_id)
      Session.set "selectedNotes", noteIds
