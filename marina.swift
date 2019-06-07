protocol View {
    associatedtype Body
    var body: Body { get }
}

struct Text : View {
    var content:String
    var body:Never {
        fatalError("Text has no body")
    }
    init<S>(_ content: S) where S : StringProtocol {
        self.content = String(content)
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

struct EmptyView: View {
    var body:Never {
        fatalError("Empty view has no body")
    }
}

struct ConditionalContent<TrueContent, FalseContent> : View where TrueContent : View, FalseContent : View {
    var body:Never {
        fatalError("Conditional view has no body yet!")
    }
    init(trueContent: TrueContent) {
    }
    init(falseContent: FalseContent) {
    }
}

@_functionBuilder
struct ViewBuilder {
    static func buildBlock() -> EmptyView {
        return EmptyView()
    }
    static func buildBlock<Content>(_ arg0: Content) -> Content where Content: View {
        return arg0
    }
    static func buildBlock<C0, C1>(_ arg0: C0, _ arg1: C1) -> TupleView<(C0, C1)> where C0: View, C1: View {
        return TupleView((arg0, arg1))
    }
    static func buildBlock<C0, C1, C2>(_ arg0: C0, _ arg1: C1, _ arg2: C2) -> TupleView<(C0, C1, C2)> where C0: View, C1: View, C2: View {
        return TupleView((arg0, arg1, arg2))
    }
    static func buildIf<Content>(_ arg0: Content?) -> Content? where Content: View {
        return arg0
    }

    static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> ConditionalContent<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        return ConditionalContent(trueContent: first)
    }
    static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> ConditionalContent<TrueContent, FalseContent> where TrueContent: View, FalseContent: View {
        return ConditionalContent(falseContent: second)
    }
}

struct HStack<Content> : View where Content: View {
    var body:Never {
        fatalError("HStack has no body")
    }
    var content:Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct MarinaDemo : View {
    var body: some View {
        HStack {
            Text("Oh hello")
            Text("This doesn't work")
            if true {
                Text("Oh hey")
            } else {
                // buildIf doesn't work yet; we need an else
            }
        }
    }
}