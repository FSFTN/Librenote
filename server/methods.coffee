Meteor.methods
  clearTrash: () ->
    Notes.remove({owner: @userId, trash: true})
    true

  sendEmail: (to, from, subject, text) ->
    check([to, from, subject, text], [ String ])
    @unblock()
    Email.send
      to: to
      from: from
      subject: subject
      text: text
    
