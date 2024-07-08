function render(ctx, _, value)
    ctx.renderer.drawText(ctx.posX, ctx.posY, value)
    print("*", ctx.posX, ctx.posY)
    return calcSize(ctx, _, value)
end

function calcSize(ctx, _, value)
    return {
        width = ctx.renderer.getTextLength(value),
        height = 8
    }
end

htmlil.registerTag("span", {
    render=render, 
    calcSize=calcSize
})
