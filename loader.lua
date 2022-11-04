local username = "DavidMGardner"
local repo = "cc-tweaked"
local branch = "main"
local folder = "KhazadDoom-2"
local gitget = "https://raw.githubusercontent.com/DavidMGardner/cc-tweaked/main/gitget.lua"

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