protocol MarinaViewBodyAccessor {
    func getBody() -> Any
}

protocol View: MarinaViewBodyAccessor {
    associatedtype Body: View
    var body: Body { get }
}

extension Never : View {
    var body: Never {
        fatalError("Nobody")
    }
}

extension View {
    func getBody() -> Any {
        return body
    }
}

protocol MarinaViewContentAccessor {
    func getContent() -> Any
}

protocol MarinaTextAccess: MarinaViewContentAccessor {
}

struct Text : View, MarinaTextAccess {
    var content:String
    var body:Never {
        fatalError("Text has no body")
    }
    init<S>(_ content: S) where S : StringProtocol {
        self.content = String(content)
    }
    func getContent() -> Any {
        return content
    }
}

protocol MarinaTupleViewAccess: MarinaViewContentAccessor {
}

struct TupleView<T>: View, MarinaTupleViewAccess {
    var body:Never {
        fatalError("Tuple view has no body")
    }
    var value:T
    init(_ value:T) {
        self.value = value
    }
    func getContent() -> Any {
        return value
    }
}

struct EmptyView: View {
    var body:Never {
        fatalError("Empty view has no body")
    }
}

protocol MarinaConditionalContentAccess: MarinaViewContentAccessor {
}

struct ConditionalContent<TrueContent, FalseContent> : View, MarinaConditionalContentAccess where TrueContent : View, FalseContent : View {
    var content:Any
    var body:Never {
        fatalError("Conditional view has no body yet!")
    }
    init(trueContent: TrueContent) {
        self.content = trueContent
    }
    init(falseContent: FalseContent) {
        self.content = falseContent
    }
    func getContent() -> Any {
        return content
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

protocol MarinaHStackAccess : MarinaViewContentAccessor {
}

struct HStack<Content> : View, MarinaHStackAccess where Content: View {
    var body:Never {
        fatalError("HStack has no body")
    }
    var content:Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    func getContent() -> Any {
        return content
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
                //Text("Not true")
            }
        }
    }
}