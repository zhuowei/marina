struct MarinaDemo : View {
    var body: some View {
        HStack {
            Text("https://github.com/zhuowei/marina")
            Text("This doesn't really work yet")
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