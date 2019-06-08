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
    static let yellow = Color()
    static let gray = Color()
    static let white = Color()
}

struct MarinaFont {
    static let title = MarinaFont()
    static let subheadline = MarinaFont()
}

struct Text : View, MarinaTextAccess {
    var content:String
    var body:Never {
        fatalError("Text has no body")
    }
    init<S>(_ content: S) where S : StringProtocol {
        self.content = String(content)
    }
    init(verbatim content: String) {
        self.content = String(content)
    }
    func getContent() -> Any {
        return content
    }
    func color(_ color: Color?) -> Text {
        return self
    }
    func font(_ font: MarinaFont) -> Text {
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
    static func buildBlock<C0, C1, C2, C3>(_ arg0: C0, _ arg1: C1, _ arg2: C2, _ arg3: C3) -> TupleView<(C0, C1, C2, C3)> where C0: View, C1: View, C2: View, C3: View {
        return TupleView((arg0, arg1, arg2, arg3))
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

struct VerticalAlignment {
    static let center = VerticalAlignment()
    static let top = VerticalAlignment()
}

struct HStack<Content> : View, MarinaHStackAccess where Content: View {
    var body:Never {
        fatalError("HStack has no body")
    }
    var content:Content
    init(alignment: VerticalAlignment = .center, @ViewBuilder content: () -> Content) {
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
    var id: Self.ID { get }
    var identifiedValue: Self.IdentifiedValue { get }
}

extension Identifiable where Self == Self.IdentifiedValue {
    var identifiedValue: Self {
        self
    }
}

extension Identifiable where Self : AnyObject {
    var id: ObjectIdentifier {
        ObjectIdentifier(self)
    }
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

protocol MarinaImageAccess: MarinaViewContentAccessor {
}

struct Image: View, MarinaImageAccess {
    var body:Never {
        fatalError("Image has no body")
    }
    var content:String
    init(url: String, label: Text) {
        self.content = url
    }
    init(systemName: String) {
        self.content = "system_" + systemName
    }
    func renderingMode(_ renderingMode: RenderingMode) -> Image {
        return self
    }
    func foregroundColor(_ color: Color) -> Image {
        return self
    }
    func getContent() -> Any {
        return content
    }
    func imageScale(_ scale: Scale) -> Image {
        return self
    }
    func clipShape(_ shape: Any) -> Image {
        return self
    }
    func overlay(_ shape: Any) -> Image {
        return self
    }
    func shadow(radius: Length) -> Image {
        return self
    }
    enum Scale {
        case small
        case medium
        case large
    }
}

protocol MarinaNavigationViewAccess: MarinaViewContentAccessor {
}

struct NavigationView<Root> : View, MarinaNavigationViewAccess where Root : View {
    var body:Never {
        fatalError("NavigationView has no body")
    }
    var content:Root
    init(@ViewBuilder root: () -> Root) {
        self.content = root()
    }
    func getContent() -> Any {
        return content
    }
}

protocol SelectionManager {
    associatedtype SelectionValue : Hashable
}

protocol MarinaListAccess: MarinaViewContentAccessor {
}

enum TitleDisplayMode {
    case large
}

struct List<Content> : View, MarinaListAccess where Content : View {
    var body:Never {
        fatalError("NavigationView has no body")
    }
    var content:Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    func getContent() -> Any {
        return content
    }
    func navigationBarTitle(_ title: Text, displayMode: TitleDisplayMode) -> List {
        return self
    }
}

struct Toggle<Label>: View where Label : View {
    var body:Never {
        fatalError("Toggle has no body")
    }
    init(isOn: Binding<Bool>, label: () -> Label) {
    }
}

struct Spacer: View {
    var body:Never {
        fatalError("Spacer view has no body")
    }
}

struct Button<Label>: View where Label : View {
    var body:Never {
        fatalError("Button has no body")
    }
    init(action: @escaping () -> Void, label: () -> Label) {
    }
}

struct Circle: View {
    // we implement this as a primitive for now
    var body:Never {
        fatalError("Button has no body")
    }
    func stroke(_ color: Color, lineWidth: Length) -> Circle {
        return self
    }
}

struct Binding<Value> {
    var value: Value {
        fatalError("no")
    }
}

struct MarinaEdgeSet: OptionSet {
    let rawValue: Int
    static let bottom = MarinaEdgeSet(rawValue: 1)
}

typealias Length = Int // todo

extension View {
    func offset(x: Length = 0, y: Length = 0) -> Self {
        // no modifiers support yet
        return self
    }
    func padding(_ edges: MarinaEdgeSet, _ length: Length) -> Self {
        // no modifiers support yet
        return self
    }
    func padding() -> Self {
        // no modifiers support yet
        return self
    }
}

protocol BindableObject : AnyObject/*, DynamicViewProperty, Identifiable, _BindableObjectViewProperty*/ {
}

@propertyDelegate
@dynamicMemberLookup
struct EnvironmentObject<BindableObjectType> where BindableObjectType : BindableObject {
    var value: BindableObjectType {
        get {
            fatalError("no")
        }
    }
    subscript<Subject>(dynamicMember keyPath: ReferenceWritableKeyPath<BindableObjectType, Subject>) -> Binding<Subject> {
        get {
            return Binding()
        }
    }
}