global = if Meteor.isServer then global else window
moduleKeywords = ['constructor', 'static']
@Module =
  Class: (namespace, specifications) ->
    currentNamespace = global
    namespaceParts = namespace.split(".")
    for part in namespaceParts
      previousNamespace = currentNamespace; lastPart = part
      currentNamespace[part] = {} if !currentNamespace[part]
      currentNamespace = currentNamespace[part]

    previousNamespace[lastPart] = specifications.constructor ? ->
    previousNamespace[lastPart]::[key] = value for key, value of specifications when key not in moduleKeywords
    previousNamespace[lastPart][key] = value for key, value of specifications.static if specifications.static