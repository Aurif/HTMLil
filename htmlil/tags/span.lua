function render(ctx, _, value)
    ctx.renderer.drawText(ctx.posX, ctx.posY, value, 0xffffff, -1, ctx.fontSize or 1)
    print("*", ctx.posX, ctx.posY)
    return calcSize(ctx, _, value)
end

function calcSize(ctx, _, value)
    local fontSize = ctx.fontSize or 1
    return {
        width = ctx.renderer.getTextLength(value, fontSize),
        height = 8*fontSize
    }
end

htmlil.registerTag("span", {
    render=render, 
    calcSize=calcSize
})
