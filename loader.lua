local username = "DavidMGardner"
local repo = "cc-tweaked"
local branch = "main"
local folder = "KhazadDoom-2"

function hte()
  if fs.exists("gitget") then
    if folder == "" then
        shell.run("gitget", username, repo, branch)
    else
        shell.run("gitget", username, repo, branch, folder)
    end
  else
    print("GitGet application does not exist. Downloading...")
    shell.run("pastebin", "get", "6aMMzdwd", "gitget")
    shell.run("gitget", username, repo, branch)
  end
end

if http then
  print("HTTP enabled. You can continue.")
  hte()
  else
    print("HTTP not enabled. App will not continue.")
end