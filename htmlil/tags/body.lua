function render(ctx, children)
    local function termFontUpload(gpu, ctx)
        ctx = ctx or gpu
        local of = io.open("term_font.png", "rb")
        local b = of._handle.read(1)
        local imgBin = {}
        while b do
            imgBin[#imgBin + 1] = ("<I1"):unpack(b);
            b = of._handle.read(1)
        end
        local image = gpu.decodeImage(table.unpack(imgBin))
        ctx.drawImage(1, 1, image.ref())
        ctx.setFont("unicode_page_e0")
        ctx.clearChars()
        for i = 1, 255 do -- 255
            local x = (i % 16) * 8
            local y = math.floor(i / 16) * 11
            local charDt = {}
            for yy = 1, 10 do
                local col = 0
                for xx = 1, 6 do
                    local r = colors.unpackRGB(image.getRGB(x + xx - 1, y + yy - 1))
                    if r > 0.5 then
                        col = bit32.bor(col, bit32.lshift(1, xx - 1))
                    end
                end
                table.insert(charDt, col)
            end
            for xx = 1, 6 do
                table.insert(charDt, 0)
            end
            ctx.addNewChar(string.char(i), 6, table.unpack(charDt))
        end
    end

    local function makeDisplay()
        local gpu = peripheral.find("tm_gpu") or error("There is no GPU connected to this computer!")
        gpu.setSize(64)
        gpu.refreshSize()
        local w, h, _, _, resolution = gpu.getSize()
        local display = gpu.createWindow(1, 1, w, h - resolution * 2)
        termFontUpload(gpu, display)

        display.draw = function()
            display.sync()
            gpu.sync()
        end

        display.fill()
        return display
    end

    local extraContext = {
        renderer = makeDisplay(),
        posX = 1, posY = 1
    }
    for _, c in pairs(children) do ctx.render(c, extraContext) end
    extraContext.renderer.draw()
end

htmlil.registerTag("body", render)
