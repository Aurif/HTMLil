function makeAlign(posAttr, sizeAttr, outerSizeAttr)
    function align()
        return {
            preRender = function(ctx)
                return ctx.extend({[posAttr]=ctx[posAttr]+ctx[outerSizeAttr]-ctx[sizeAttr]})
            end
        }
    end
    return align
end

htmlil.registerStyle("alignRight", makeAlign("posX", "width", "outerWidth"))
htmlil.registerStyle("alignBottom", makeAlign("posY", "height", "outerHeight"))

function makeAlignCenter(posAttr, sizeAttr, outerSizeAttr)
    function alignCenter()
        return {
            preRender = function(ctx)
                return ctx.extend({[posAttr]=ctx[posAttr]+math.floor((ctx[outerSizeAttr]-ctx[sizeAttr])/2)})
            end
        }
    end
    return alignCenter
end
htmlil.registerStyle("alignCenterHorizontal", makeAlignCenter("posX", "width", "outerWidth"))
htmlil.registerStyle("alignCenterVertical", makeAlignCenter("posY", "height", "outerHeight"))