struct MarinaDemo : View {
    var body: some View {
        HStack {
            Text("Oh hello")
            Text("This doesn't work")
            if true {
                Image(url: "hello.jpg", label: Text("Hello"))
            } else {
                Text("Not true")
            }
        }
    }
}

let emitter = DOMEmitter()
render(view: MarinaDemo(), emitter: emitter)
print(emitter.buffer)