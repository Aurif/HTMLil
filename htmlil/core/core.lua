require("htmlil.core.component")
require("htmlil.core.context")
htmlil = {}

tags = {}
htmlil.registerTag = function(key, renderFunc)
    local function callable(...)
        local children = {}
        local params = {}
        for _, v in pairs({...}) do
            if v.isComponent then
                table.insert(children, v)
            else
                table.insert(params, v)
            end
        end
        return component(renderFunc, children, params)
    end
    tags[key] = callable
end

function document(body)
    local context = body.render(context())
end
