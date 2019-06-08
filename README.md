Understanding SwiftUI by reimplementing it to render to HTML.

----

Want to keep up with Swift news on your Amazon Echo or Google Home smart speaker? [Follow me on Voco](https://askvoco.com).

----

# What it does

Almost nothing!

It can barely render the homepage of Apple's Landmarks sample from [the SwiftUI tutorial](https://developer.apple.com/tutorials/swiftui/handling-user-input) to HTML.

<img src="https://pbs.twimg.com/media/D8hDbB_VsAA00Vf.jpg:large" width="320">

I just wanted to learn the new function builder feature that powers SwiftUI's DSL.

See also:

- [Swift Evolution pull request for function builders](https://github.com/apple/swift-evolution/pull/1046)
- [Swift pull request with function builder samples](https://github.com/apple/swift/pull/25221)
- [Swift Evolution pull request for property delegates](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-delegates.md)
- [SwiftRocks's article on SwiftUI's tricks](https://swiftrocks.com/inside-swiftui-compiler-magic.html)

# Building

Install Xcode 11 beta 1, then

```
./build.sh
```

# Running

```
git clone https://github.com/zhuowei/marina-sample-landmarks.git LandmarkTutorial3Complete
./landmarkDemo.sh
./run.sh >output.html
cat html_template/head.html output.html >output_full.html
```

# License

Apache 2.0 with the Runtime Library Exception.

Files in systemicon are from [Ionicons](https://github.com/ionic-team/ionicons) and are under the Ionic project's MIT license.
