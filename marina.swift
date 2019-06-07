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

struct Color {
    static let primary = Color()
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
    func color(_ color: Color?) -> Text {
        return self
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

protocol MarinaVStackAccess : MarinaViewContentAccessor {
}

struct HorizontalAlignment {
    static let center = HorizontalAlignment()
    static let leading = HorizontalAlignment()
}

struct VStack<Content> : View, MarinaVStackAccess where Content: View {
    var body:Never {
        fatalError("VStack has no body")
    }
    var content:Content
    init(alignment: HorizontalAlignment = .center, @ViewBuilder content: () -> Content) {
        self.content = content()
    }
    func getContent() -> Any {
        return content
    }
}

protocol MarinaZStackAccess : MarinaViewContentAccessor {
}

struct ZStack<Content> : View, MarinaHStackAccess where Content: View {
    var body:Never {
        fatalError("ZStack has no body")
    }
    var content:Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    func getContent() -> Any {
        return content
    }
}

protocol MarinaScrollViewAccess: MarinaViewContentAccessor {
}

struct ScrollView<Content>: View, MarinaScrollViewAccess where Content: View {
    var body:Never {
        fatalError("ScrollView has no body")
    }
    var content:Content
    init(showsHorizontalIndicator: Bool = true, @ViewBuilder content: () -> Content) {
        self.content = content()
    }
    func getContent() -> Any {
        return content
    }
}

protocol Identifiable {
    associatedtype ID: Hashable
    associatedtype IdentifiedValue = Self
}

struct ForEach<Data, Content> : View where Data : RandomAccessCollection, Content : View, Data.Element : Identifiable {
    var body:Never {
        fatalError("ForEach has no body")
    }
    var data: Data
    var content: (Data.Element.IdentifiedValue) -> Content
    init(_ data: Data, content: @escaping (Data.Element.IdentifiedValue) -> Content) {
        self.data = data
        self.content = content
    }
}

struct NavigationButton<Label, Destination> : View where Label : View, Destination : View {
    var body:Never {
        fatalError("NavigationButton has no body")
    }
    init(destination: Destination, isDetail: Bool = true, onTrigger: @escaping () -> Bool = { true }, label: () -> Label) {
    }
}

enum RenderingMode {
    case automatic
}

struct Image: View {
    var body:Never {
        fatalError("Image has no body")
    }
    init(url: String, label: Text) {
    }
    func renderingMode(_ renderingMode: RenderingMode) -> Image {
        return self
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