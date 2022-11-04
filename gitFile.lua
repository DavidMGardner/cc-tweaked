local username = "DavidMGardner"
local repo = "cc-tweaked"
local branch = "main"
local folder = "KhazadDoom-2"
local file = "test.lua"
local outputFile = "test"

local function save(data,file)
    local file = shell.resolve(file)
    if not (fs.exists(string.sub(file,1,#file - #fs.getName(file))) and fs.isDir(string.sub(file,1,#file - #fs.getName(file)))) then
            if fs.exists(string.sub(file,1,#file - #fs.getName(file))) then fs.delete(string.sub(file,1,#file - #fs.getName(file))) end
            fs.makeDir(string.sub(file,1,#file - #fs.getName(file)))
    end
    local f = fs.open(file,"w")
    f.write(data)
    f.close()
end

local function download(url, file)
    save(http.get(url).readAll(),file)
end

download("https://raw.githubusercontent.com/"..username.."/"..repo.."/"..branch.."/"..folder.."/"..file, outputFile)

--https://raw.githubusercontent.com/DavidMGardner/cc-tweaked/main/KhazadDoom-2/test.lua