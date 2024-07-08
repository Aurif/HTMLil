require("htmlil.core.component")
require("htmlil.core.context")
htmlil = {}

tags = {}
htmlil.registerTag = function(key, renderFunc)
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
        return component(renderFunc, children, params, styles)
    end
    tags[key] = callable
end

style = {}
htmlil.registerStyle = function(key, styleHandlersFunc)
    local function callable(...)
        local directHandlers = styleHandlersFunc(...)
        local defaultFunc = function(ctx) return ctx end
        return {
            isStyle = true,
            preRender = directHandlers.preRender or defaultFunc,
            postRender = directHandlers.postRender or defaultFunc
        }
    end
    style[key] = callable
end

function document(body)
    local context = body.render(context())
end
