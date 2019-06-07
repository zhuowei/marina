func render<Content: View>(view: Content) where Content.Body == Never {
    // I'm so, so sorry.
    if let v = view as? TupleView<Any> {
    } else {
        fatalError()
    }
}

func render<Content: View>(view: Content) where Content.Body: View {
    print("grab body", view)
    let body = view.body
    render(view: body)
}

func render<Content: View>(view: Content) {
    print("unimplemented", view)
}