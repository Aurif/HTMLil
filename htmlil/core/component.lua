function component(tagRender, children, params, styles)
    local function componentRender(ctx)
        local currentCtx = ctx
        for _, style in pairs(styles) do currentCtx = style.preRender(currentCtx) end
        
        local result = tagRender(currentCtx, children, table.unpack(params))

        local currentResult = context(result)
        for _, style in pairs(styles) do currentResult = style.postRender(currentResult) end
        return currentResult
    end

    return {
        render = componentRender,
        isComponent = true
    }
end
