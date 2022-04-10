import SwiftUI
import Logger

struct ContentView: View {

    let defaultLogger = Logger.default
    let customLogger = Logger(
        configuration: LoggerConfiguration(
            requiredLogs: [.logLevel, .message]
        )
    )

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                defaultLogger.log(.information, "This is default logger!")
                customLogger.log(.information, "This is custom logger!")
            }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
