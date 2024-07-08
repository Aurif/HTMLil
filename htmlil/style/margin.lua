function makeMargin(preAttr, postAttr)
    function margin(pixels)
        return {
            preRender = function(ctx) 
                if preAttr == nil then return ctx end
                return ctx.extend({[preAttr] = ctx[preAttr]+pixels}) 
            end,
            postRender = function(res) return res.extend({[postAttr] = res[postAttr]+pixels}) end
        }
    end
    return margin
end

htmlil.registerStyle("marginLeft", makeMargin("posX", "width"))
htmlil.registerStyle("marginRight", makeMargin(nil, "width"))
htmlil.registerStyle("marginTop", makeMargin("posY", "height"))
htmlil.registerStyle("marginBottom", makeMargin(nil, "height"))