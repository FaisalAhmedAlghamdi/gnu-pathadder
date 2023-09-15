import std/[
    strformat,
    strbasics,
    os
]


proc addFolderToPath*(folderName: var string) =
    if folderName == "":
        raise newException(Exception, "Input was empty")

    var pathToEnvFile = ""
    try:
        pathToEnvFile = fmt"{os.getHomeDir()}.bashrc"
    except:
        pathToEnvFile = fmt"{os.getHomeDir()}.zshrc"

    let file = open(pathToEnvFile, fmAppend)

    # remove whitespaces
    strip(folderName)

    file.writeLine(fmt"export PATH={folderName}:$PATH")

    defer: file.close()
