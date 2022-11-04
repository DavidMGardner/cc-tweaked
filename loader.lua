local username = "DavidMGardner"
local repo = "cc-tweaked"
local branch = "main"
local folder = "KhazadDoom-2"
local gitget = "https://raw.githubusercontent.com/DavidMGardner/cc-tweaked/main/gitget.lua"

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

function runGitGet()
    if folder == "" then
        shell.run("gitget", username, repo, branch)
    else
        print("GitGet Downloading from Folder...")
        shell.run("gitget", username, repo, branch, folder)
    end
end

function hte()
  if fs.exists("gitget") then
    runGitGet()
  else
    print("GitGet application does not exist. Downloading...")
    download(gitget, "gitget")
    runGitGet()
  end
end

if http then
  print("HTTP enabled. You can continue.")
  hte()
  else
    print("HTTP not enabled. App will not continue.")
end