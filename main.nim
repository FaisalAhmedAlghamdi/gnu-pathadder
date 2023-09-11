import owlkettle
import os
import std/strformat

viewable App:
    path: string

method addtoPath(app: AppState, folderName: string) {.base.} =
    let pathToBashrc = fmt"{os.getHomeDir()}.bashrc"
    let file = open(pathToBashrc, fmAppend)
    defer: file.close()
    try:
        file.writeLine(fmt"export PATH={folderName}:$PATH")
        discard app.open: gui:
            MessageDialog:
                message = "Sucess, you can now close the program."
                DialogButton {.addButton.}:
                    text = "Ok."
                    res = DialogAccept
    except IOError:
        discard app.open: gui:
            MessageDialog:
                message = "Could not open .bashrc, Please report this to the developers."
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
                    proc changed(path: string)=
                        app.path = path
                Button {.expand: true.}:
                    text = "Click me to add a folder to path"
                    style = [ButtonSuggested]
                    proc clicked() =
                        app.addtoPath(app.path)

brew(gui(App()))
