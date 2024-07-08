function makeSizePercentage(attr, outerAttr)
    function sizePercentage(perc)
        if perc > 1 then error("Tried setting "..attr.." to over 100%") end
        return {
            preRender = function(ctx) return ctx.extend({[attr] = ctx[outerAttr]*perc}) end
        }
    end
    return sizePercentage
end

htmlil.registerStyle("width", makeSizePercentage("width", "outerWidth"))
htmlil.registerStyle("height", makeSizePercentage("height", "outerHeight"))