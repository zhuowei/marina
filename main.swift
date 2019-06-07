let emitter = DOMEmitter()
render(view: MarinaDemo(), emitter: emitter)
print(emitter.buffer)