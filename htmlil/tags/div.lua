function makeRender(axis1, axis2, posKey)
    local outer = {width="outerWidth", height="outerHeight"}

    local function render(ctx, children)
        local ax1 = ctx[axis1]
        local pos = ctx[posKey]
        for _, c in pairs(children) do
            local result = ctx.render(c, {
                [posKey]=pos, 
                [outer[axis1]]=ctx[axis1],
                [outer[axis2]]=c.calcSize(ctx)[axis2]
            })
            ax1 = math.max(ax1, result[axis1] or 0)
            pos = pos + (result[axis2] or 0)
        end
        return {
            [axis1] = ax1,
            [axis2] = pos-ctx[posKey]
        }
    end

    local function calcSize(ctx, children)
        local ax1 = 0
        local ax2 = 0
        
        for _, c in pairs(children) do
            local result = c.calcSize(ctx)
            ax1 = math.max(ax1, result[axis1] or 0)
            ax2 = ax2 + (result[axis2] or 0)
        end
        return {
            [axis1] = ax1,
            [axis2] = ax2
        }
    end

    return {
        render=render, 
        calcSize=calcSize
    }
end
htmlil.registerTag("divColumn", makeRender("width", "height", "posY"))
htmlil.registerTag("divRow", makeRender("height", "width", "posX"))