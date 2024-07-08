function context(dict)
    local function extend(extraContext)
        local newContextDict = {}
        for k,v in pairs(dict or {}) do newContextDict[k] = v end
        for k,v in pairs(extraContext or {}) do newContextDict[k] = v end
        return context(newContextDict)
    end
    local function render(component, extraContext)
        return component.render(extend(extraContext))
    end

    local contextDict = {
        extend = extend,
        render = render
    }
    for k,v in pairs(dict or {}) do contextDict[k] = v end
    return contextDict
end