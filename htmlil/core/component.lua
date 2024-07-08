function component(tagRender, children, params)
    local function componentRender(context)
        local extraContext = tagRender(context.renderer, table.unpack(params))
        local newContext = {}
        for k,v in pairs(context) do newContext[k] = v end
        for k,v in pairs(extraContext or {}) do newContext[k] = v end

        print(#children, #params)
        for _, c in pairs(children) do c.render(newContext) end
        return newContext
    end

    return {
        render = componentRender,
        isComponent = true
    }
end
