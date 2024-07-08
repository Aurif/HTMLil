function context(dict)
    local function render(component, extraContext)
        local newContextDict = {}
        for k,v in pairs(dict or {}) do newContextDict[k] = v end
        for k,v in pairs(extraContext or {}) do newContextDict[k] = v end
        return component.render(context(newContextDict))
    end

    local contextDict = {
        render = render
    }
    for k,v in pairs(dict or {}) do contextDict[k] = v end
    return contextDict
end