function render(ctx, _, value)
    ctx.renderer.drawText(ctx.posX, ctx.posY, value)
    return {
        width = ctx.renderer.getTextLength(value),
        height = 8
    }
end
htmlil.registerTag("span", render)
