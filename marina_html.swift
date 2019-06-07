// I am truly sorry for this. Look, I never learned generics.
// If you have resources on what I should look into to implement this properly,
// please open an issue!

func render<Content: View>(view: Content) -> String {
    var out = ""
    print("Rendering", view)
    if let v = view as? MarinaHStackAccess {
        print("<div>")
        render(view: )
        print("</div>")
    } else {
        print("has body!")
        render(view: view.body)
    }
}