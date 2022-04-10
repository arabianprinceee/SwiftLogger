# SwiftLogger

#### SwiftLogger is a simple lightweight console logger for iOS and macOS projects. 
#### Customizable and easy to use. That's exactly what you need in your project!

## Usage

### Swift Package Manager:

Add dependency to your ```Package.swift``` file:
```swift
.package(url: "https://github.com/arabianprinceee/SwiftLogger.git", exact: "x.x.x")
```

Then add SwiftLogger to your target's dependencies:
```swift
.target(name: "some_name", dependencies: ["SwiftLogger"]),
```

#### Import package:

Then import package to use SwiftLogger in your app:
```swift
import SwiftLogger
```
And that's it!

#### In-app usage:

Create an instance of Logger:

```swift
let defaultLogger = Logger.default
let customLogger = Logger(
    configuration: LoggerConfiguration(
        requiredLogs: [.logLevel, .message] // Pick the logs you need here
    )
)
```

And then use it easily:

```swift
Text("Hello, world!")
    .onAppear {
        defaultLogger.log(.information, "This is default logger!")
        customLogger.log(.information, "This is custom logger!")
    }
```
## Author

Ben Mustafa Anas, anas.mustafa2301@gmail.com

## License

SwiftLogger is available under the MIT license. See the LICENSE file for more info.

