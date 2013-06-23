# SubSuper

SubSuper is an under development Mac OS native subtitle synchronizer for human beings.

Currently it's just a bunch of management classes and won't run a graphical interface if you compile it in your Xcode. It supports the most common [SubRip](http://www.matroska.org/technical/specs/subtitles/srt.html) format.

## Development

With the use of [CocoaPods](http://cocoapods.org/), it is expected that you always open the **.xcworkspace** file in development sessions. This will automatically load the Pods project with the dependencies.

```console
open SubSuper.xcworkspace
```

To any contribution, the test suite is your friend. The library used for unit testing is [Kiwi](https://github.com/allending/Kiwi). With the project opened, just hit `⌘U` and get the result from all the application's tests.
