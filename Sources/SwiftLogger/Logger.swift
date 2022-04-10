import Foundation

public struct Logger {

    // MARK: - Private types

    fileprivate typealias LogType = LoggerConfiguration.LogType

    // MARK: - Public properties

    public static var `default`: Logger {
        let logger = Logger(configuration: LoggerConfiguration.default)
        return logger
    }

    // MARK: - Private properties

    private let configuration: LoggerConfiguration

    // MARK: - Init

    public init(
        configuration: LoggerConfiguration
    ) {
        self.configuration = configuration
    }

    // MARK: - Public methods

    public func log(
        _ level: LogLevel,
        _ message: String,
        file: StaticString = #file,
        function: StaticString = #function,
        line: UInt = #line
    ) {
        switch level {
        case .error:
            internalLog(.error, message, file, function, line)
        case .information:
            internalLog(.information, message, file, function, line)
        case .success:
            internalLog(.success, message, file, function, line)
        case .warning:
            internalLog(.warning, message, file, function, line)
        }
    }

    // MARK: - Private methods
    
    private func internalLog(
        _ logLevel: LogLevel,
        _ message: String,
        _ file: StaticString,
        _ function: StaticString,
        _ line: UInt
    ) {
        let constructedString = constructLogString(logLevel, message, file, function, line)
        print(constructedString)
    }

    private func constructLogString(
        _ logLevel: LogLevel,
        _ message: String,
        _ file: StaticString,
        _ function: StaticString,
        _ line: UInt
    ) -> String {
        let requiredLogs = configuration.requiredLogs
        var result: [(logType: LogType, string: String)] = .empty
        requiredLogs.forEach { logType in
            switch logType {
            case .filePath:
                result.append((.filePath, "At file: \(file)"))
            case .functionName:
                result.append((.functionName, "Inside function: \(function)"))
            case .lineNumber:
                result.append((.lineNumber, "At code line: \(line)"))
            case .message:
                result.append((.message, "With message: \(message)"))
            case .time(let formatter):
                result.append((.time(formatter), "Time: \(formatter.string(from: Date()))"))
            case .logLevel:
                result.append((.logLevel, "\(logLevel.rawValue)"))
            }
        }
        let resultString =
            result
            .sorted(by: { $0.logType.orderNumber < $1.logType.orderNumber })
            .map { $0.string }
            .joined(separator: "\n")
        return resultString.appending("\n")
    }

}
