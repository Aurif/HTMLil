require("htmlil.core.component")
require("htmlil.core.context")
htmlil = {}

tags = {}
htmlil.registerTag = function(key, tag)
    if tag == nil then error('Invalid tag "' .. key .. '" - functions were not provided') end
    if tag.render == nil then error('Invalid tag "' .. key .. '" - missing render function') end
    if tag.calcSize == nil then error('Invalid tag "' .. key .. '" - missing calcSize function') end

    local function callable(...)
        local children = {}
        local styles = {}
        local params = {}
        for _, v in pairs({...}) do
            if v.isComponent then
                table.insert(children, v)
            elseif v.isStyle then
                table.insert(styles, v)
            else
                table.insert(params, v)
            end
        end
        return component(tag, children, params, styles)
    end
    tags[key] = callable
end

style = {}
htmlil.registerStyle = function(key, styleHandlersFunc)
    if styleHandlersFunc == nil then error('Invalid style "' .. key .. '" - handlers were not provided') end
    local function callable(...)
        local directHandlers = styleHandlersFunc(...)
        local defaultFunc = function(ctx) return ctx end
        return {
            isStyle = true,
            preRender = directHandlers.preRender or defaultFunc,
            postRender = directHandlers.postRender or defaultFunc,
            postCalcSize = directHandlers.postCalcSize or defaultFunc,
            preCalcSize = directHandlers.preCalcSize or defaultFunc
        }
    end
    style[key] = callable
end

function document(body)
    local initialCtx = body.init()
    body.render(context(initialCtx))
end
