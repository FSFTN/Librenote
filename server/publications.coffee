Meteor.publish "allNotes",(searchValue) ->
  console.log "searchValue "+ searchValue
  if searchValue is ""
    Notes.find({owner: @userId}, {sort: {date: -1}})
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
