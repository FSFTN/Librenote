Meteor.methods
  clearTrash: () ->
    Notes.remove({owner: @userId, trash: true})

  sendEmail: (to, from, subject, text) ->
    check([to, from, subject, text], [ String ])
    @unblock()
    Email.send
      to: to
      from: from
      subject: subject
      text: text
    
  trashMultipleNotes:(noteIds)->
    if noteIds
      Notes.update({_id: {$in: noteIds}}, {$set: trash: true, archive: false},{multi: true})

  archiveMultipleNotes:(noteIds)->
    if noteIds
      Notes.update({_id: {$in: noteIds}}, {$set: archive: true, trash: false},{multi: true})
      
  deleteMultipleNotes:(noteIds)->
    if noteIds
      Notes.remove({_id: {$in: noteIds}})

  restoreMultipleNotes:(noteIds)->
    if noteIds
      Notes.update({_id: {$in: noteIds}}, {$set: archive: false, trash: false},{multi: true})
