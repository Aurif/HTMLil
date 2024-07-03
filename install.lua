function installGithubLibrary(url, libName)
    local remoteLastUpdate =
        textutils.unserialiseJSON(http.get("https://api.github.com/repos/" .. url).readAll())["pushed_at"]
    local localLastUpdate = nil
    local markerFile = fs.open(libName .. ".lastUpdate", "r")
    if f ~= nil then
        localLastUpdate = f.readAll()
        f.close()
    end
    if remoteLastUpdate == localLastUpdate then
        print(libName .. " is up to date")
        return
    end
    print("Updating " .. libName .. "...")

    local treeUrl = "https://api.github.com/repos/" .. url .. "/git/trees/main?recursive=10"
    local fileList = textutils.unserialiseJSON(http.get(treeUrl))["tree"]
    for _, file in pairs(fileList) do
        if file.type == "blob" and file.path:find("^src/") ~= nil then
            local fileContent = http.get("https://raw.githubusercontent.com/" .. url .. "/main/" .. file.path).readAll()
            local localFile = fs.open(file.path:sub(4), "w")
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
