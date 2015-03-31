Module 'Wings.Component',
  defineApp: (source, destination) ->
    if typeof source is 'string'
      console.log "You're trying defines a not exists template" if !Template[source]
      source = Template[source]

    @cloneTemplateEssential(source, destination)

    source.rendered = ->
      @customBinding(destination.ui, @) if destination.ui
      @autoBinding(@)
      @invokeIfNecessary(destination.rendered, @)
      @initializeApp()

  defineWidget: (source, destination) ->
    if typeof source is 'string'
      console.log "You're trying defines a not exists template" if !Template[source]
      source = Template[source]

    @cloneTemplateEssential(source, destination)

    source.rendered = ->
      @customBinding(destination.ui, @) if destination.ui
      @invokeIfNecessary(destination.rendered, @)