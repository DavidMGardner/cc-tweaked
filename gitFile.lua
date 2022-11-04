local username = "DavidMGardner"
local repo = "cc-tweaked"
local branch = "main"
local folder = "KhazadDoom-2"
local file = "test.lua"
local outputFile = "test3"

local args = {...}

local function save(data,file)
    print("Downloading "..file.."...")
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

if arg[1] ~= "" and arg[2] ~= "" then
    folder = arg[1]
    file = arg[2]
    outputFile = arg[2]

    print("Arg3 = "..arg[3])

    if not arg[3] ~= nil then
	print("Setting outputFile to "..arg[3])
        outputFile = arg[3]
    end
end

local url = "https://raw.githubusercontent.com/"..username.."/"..repo.."/"..branch.."/"..folder.."/"..file

print("Downloading "..url.."...")
download(url, outputFile)

--https://raw.githubusercontent.com/DavidMGardner/cc-tweaked/main/KhazadDoom-2/test.lua