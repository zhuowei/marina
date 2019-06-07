// I am truly sorry for this. Look, I never learned generics.
// If you have resources on what I should look into to implement this properly,
// please open an issue!
func classNameRemovingGenerics(_ obj: Any) -> String {
    let classType = type(of: obj)
    let className = String(describing: classType)
    return String(className.split(separator: "<", maxSplits: 1)[0])
}

func access(_ view: Any, _ varname: String) -> Any {
    let mirror = Mirror(reflecting: view)
    return mirror.descendant(varname)!
}

func accessBody(_ view: Any) -> Any {
    // oh yeah
    return "test"
}

func remangle(className: String) -> String {
    var out = ""
    for part in className.split(separator: ".") {
        out += "\(part.count)\(part)"
    }
    return out
}
func obtainGetterName(type: Any.Type) -> String {
    let classNameMangled = remangle(className: String(reflecting: type))
    print(classNameMangled)
    return classNameMangled
}

func render(view: Any) {
    print("Rendering", view)
    if String(describing: view) == "nil" {
        return
    }
    let className = classNameRemovingGenerics(view)
    print(_typeName(type(of: view), qualified: true))
    switch className {
        case "HStack":
            print("hstack")
        case "Text":
            print("text")
        case "TupleView":
            print("TupleView")
        default:
            print("Unsupported view type: " + className)
            print(obtainGetterName(type: type(of: view)))
    }
}