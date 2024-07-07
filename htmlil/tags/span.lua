function render(renderer, value)
    renderer.drawText(1, 1, value)
end
htmlil.registerTag("span", render)
