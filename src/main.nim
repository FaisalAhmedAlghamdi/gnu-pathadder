import owlkettle
from backends import addFolderToPath
import std/strformat


viewable App:
    path: string


method view(app: AppState): Widget =
    result = gui:
        Window:
            title = "Libre Path adder program"
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
                        try:
                            addFolderToPath(app.path)
                            discard app.open: gui:
                                MessageDialog:
                                    message = "Sucess, folder has been added to path"
                                    DialogButton {.addbutton.}:
                                        text = "Ok"
                        except Exception as e:
                            discard app.open: gui:
                                MessageDialog:
                                    message = fmt"An error happened! {e.msg}"
                                    DialogButton {.addbutton.}:
                                        text = "Ok"


brew(gui(App()))
