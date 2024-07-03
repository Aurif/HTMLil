function httpGet(url)
    local connection = http.get(url)
    local data = connection.readAll()
    connection.close()
    return data
end

function installGithubLibrary(url, libName)
    local remoteLastUpdate = textutils.unserialiseJSON(httpGet("https://api.github.com/repos/" .. url))["pushed_at"]
    local localLastUpdate = nil
    local markerFile = fs.open(libName .. ".lastUpdate", "r")
    if markerFile ~= nil then
        localLastUpdate = markerFile.readAll()
        markerFile.close()
    end
    if remoteLastUpdate == localLastUpdate then
        print(libName .. " is up to date")
        return
    end
    print("Updating " .. libName .. "...")

    local treeUrl = "https://api.github.com/repos/" .. url .. "/git/trees/main?recursive=10"
    local fileList = textutils.unserialiseJSON(httpGet(treeUrl))["tree"]
    for _, file in pairs(fileList) do
        if file.type == "blob" and file.path:find("^src/") ~= nil then
            local fileContent = httpGet("https://raw.githubusercontent.com/" .. url .. "/main/" .. file.path)
            local localFile = fs.open(libName .. "/" .. file.path:sub(4), "w")
            localFile.write(fileContent)
            localFile.close()
        end
    end

    markerFile = fs.open(libName .. ".lastUpdate", "w")
    markerFile.write(remoteLastUpdate)
    markerFile.close()
    print("Update completed")
end

installGithubLibrary("Aurif/HTMLil", "htmlil")
