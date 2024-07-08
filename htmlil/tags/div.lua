function makeRender(axis1, axis2, posKey)
    local function render(ctx, children)
        local ax1 = 0
        local pos = ctx[posKey]
        for _, c in pairs(children) do
            local result = ctx.render(c, {[posKey]=pos})
            ax1 = math.max(ax1, result[axis1] or 0)
            pos = pos + (result[axis2] or 0)
        end
        return {
            [axis1] = ax1,
            [axis2] = pos
        }
    end
    return render
end
htmlil.registerTag("divColumn", makeRender("width", "height", "posY"))
htmlil.registerTag("divRow", makeRender("height", "width", "posX"))