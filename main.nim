import std/[
  os,
  strformat,
  strbasics
]

import owlkettle


viewable App:
    path: string

proc addtoPath(app: AppState, folderName: string) =
    let pathToBashrc = fmt"{os.getHomeDir()}.bashrc"
    let file = open(pathToBashrc, fmAppend)

    # looks weird but i need to copy the string as var so i can pass it into strip.
    var folderName = folderName

    # remove whitespaces
    strip(folderName)
    defer: file.close()
    try:
        file.writeLine(fmt"export PATH={folderName}:$PATH")
        discard app.open: gui:
            MessageDialog:
                message = "Sucess, you can now close the program."
                DialogButton {.addButton.}:
                    text = "Ok."
                    res = DialogAccept
    except IOError as e:
        discard app.open: gui:
            MessageDialog:
                message = fmt"An error happened report this message to the developers: {e.msg}"
                DialogButton {.addButton.}:
                    text = "Ok."
                    res = DialogAccept


method view(app: AppState): Widget =
    result = gui:
        Window:
            title = "GNU Path adder program"
            defaultSize = (200, 200)
            Box(orient = OrientY, spacing = 6, margin = 12):
                Entry:
                    placeholder = "Enter the path here."
                    proc changed(path: string) =
                        app.path = path
                Button {.expand: true.}:
                    text = "Click me to add a folder to path"
                    style = [ButtonSuggested]
                    proc clicked() =
                        app.addtoPath(app.path)

brew(gui(App()))
