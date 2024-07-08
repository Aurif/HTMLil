function component(tagRender, children, params)
    local function componentRender(context)
        return tagRender(context, children, table.unpack(params))
    end

    return {
        render = componentRender,
        isComponent = true
    }
end
