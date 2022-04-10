import Foundation

public struct LoggerConfiguration {

    // MARK: - Public types

    public enum LogType: Hashable {

        case logLevel
        case filePath
        case functionName
        case lineNumber
        case message
        case time(DateFormatter)

        // TODO: - Think about give the user an ability to make custom priority

        public var orderNumber: Int {
            switch self {
            case .filePath:
                return 3
            case .functionName:
                return 4
            case .lineNumber:
                return 5
            case .message:
                return 2
            case .time(_):
                return 1
            case .logLevel:
                return 0
            }
        }

    }

    // MARK: - Public properties

    public let requiredLogs: Set<LogType>

    /// Provides the default (aka full)  version of `Logger` with full set of available log types and with default `DateFormatter` for time logging.
    public static var `default`: LoggerConfiguration {
        let configuration = LoggerConfiguration(
            requiredLogs: [
                .logLevel,
                .filePath,
                .functionName,
                .lineNumber,
                .message,
                .time(defaultDateFormatter)
            ]
        )
        return configuration
    }

    // MARK: - Private properties

    private static var defaultDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss:SSS"
        return dateFormatter
    }

    // MARK: - Init

    public init(
        requiredLogs: Set<LogType>
    ) {
        self.requiredLogs = requiredLogs
    }

}
