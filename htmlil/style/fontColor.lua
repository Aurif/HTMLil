function fontColor(color)
    return {
        preRender = function(ctx) return ctx.extend({fontColor = color}) end
    }
end

htmlil.registerStyle("fontColor", fontColor)