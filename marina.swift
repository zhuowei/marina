protocol View {
    associatedtype Body
    var body: Body { get }
}

struct Text : View {
    var body:Never {
        fatalError("Text has no body")
    }
    init<S>(_ content: S) where S : StringProtocol {
    }
}

struct TupleView<T>: View {
    var body:Never {
        fatalError("Tuple view has no body")
    }
    var value:T
    init(_ value:T) {
        self.value = value
    }
}

@_functionBuilder
struct ViewBuilder {
    static func buildBlock<C0, C1>(_ arg0: C0, _ arg1: C1) -> TupleView<(C0, C1)> {
        return TupleView((arg0, arg1))
    }
}

struct HStack<Content> : View where Content: View {
    var body:Never {
        fatalError("HStack has no body")
    }
    init(@ViewBuilder content: () -> Content) {
    }
}

struct MarinaDemo : View {
    var body: some View {
        HStack {
            Text("Oh hello")
            Text("This doesn't work")
        }
    }
}