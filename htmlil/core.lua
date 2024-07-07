htmlil = {}

tags = {}
htmlil.registerTag = function(key, renderFunc)
    tags[key] = renderFunc
end
