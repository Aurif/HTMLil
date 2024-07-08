require("htmlil.core.component")
htmlil = {}

tags = {}
htmlil.registerTag = function(key, renderFunc)
    local function callable(...)
        local children = {}
        local params = {}
        print(":" .. key .. ":")
        for _, v in pairs({...}) do
            print(" ? ", v, v.isComponent)
            if v.isComponent then
                table.insert(children, v)
                print(" + child")
            else
                table.insert(params, v)
                print(" + param")
            end
        end
        return component(renderFunc, children, params)
    end
    tags[key] = callable
end

function document(body)
    local context = body.render({})
    context.renderer.draw()
end
