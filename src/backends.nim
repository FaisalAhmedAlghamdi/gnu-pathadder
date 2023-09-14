import std/[
    strformat,
    strbasics,
    os
]


proc addFolderToPath*(folderName: string) =
    if folderName == "":
        raise newException(Exception, "Input was empty")

    var pathToEnvFile = ""
    try:
        pathToEnvFile = fmt"{os.getHomeDir()}.bashrc"
    except:
        pathToEnvFile = fmt"{os.getHomeDir()}.zshrc"
    

    let file = open(pathToEnvFile, fmAppend)

    # looks weird but i need to copy the string so i can pass it into strip.
    var folderName = folderName

    # remove whitespaces
    strip(folderName)

    file.writeLine(fmt"export PATH={folderName}:$PATH")

    defer: file.close()
