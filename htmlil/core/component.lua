function component(tag, children, params, styles)
    local cachedCalcSize = nil
    local function calcSize(ctx)
        if cachedCalcSize == nil then
            local currentCalcSize = context(tag.calcSize(ctx, children, table.unpack(params)))
            for _, style in pairs(styles) do currentCalcSize = style.postCalcSize(currentCalcSize) end
            cachedCalcSize = currentCalcSize
        end
        return cachedCalcSize
    end

    local function render(ctx)
        local currentCtx = ctx.extend(calcSize(ctx))
        for _, style in pairs(styles) do currentCtx = style.preRender(currentCtx) end
        
        local result = tag.render(currentCtx, children, table.unpack(params))

        local currentResult = context(result)
        for _, style in pairs(styles) do currentResult = style.postRender(currentResult) end
        return currentResult
    end

    return {
        render = render,
        calcSize = calcSize,
        init = tag.init,
        isComponent = true
    }
end
