function fontSize(size)
    return {
        preRender = function(ctx) return ctx.extend({fontSize = size}) end,
        preCalcSize = function(ctx) return ctx.extend({fontSize = size}) end
    }
end

htmlil.registerStyle("fontSize", fontSize)