@Notes = new Mongo.Collection 'notes'

Schemas = {}

Schemas.Note = new SimpleSchema
  title: {
    type: String
    max: 300
    optional: true
    #index: 1
  },
  content: {
    type: String
    optional: true
    #index: 1
  },
  type:{
    type: String
  },
  color:{
    type: String
  },
  trash:{
    type: Boolean
  },
  archive:{
    type: Boolean
  },
  createdAt:{
    type: Date
    denyUpdate: true
  },
  lastModified:{
    type: Date
    denyInsert: true
    optional: true
  },
  owner: {
    type: String
  }


@Notes.attachSchema(Schemas.Note)
