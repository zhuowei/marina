let emitter = DOMEmitter()
globalEnvironmentObject = UserData()
render(view: LandmarkList(), emitter: emitter)
print(emitter.buffer)
