//
//  Log.swift
//  LogUtil
//
//  Created by Larry Burris on 7/2/21.
//
//  Usage:
//  Log.info("Slow networking connectivity detected.")
//  Log.warning("Username should not be nil.")
//  Log.error("User authentication failed.")
//
import Foundation

enum Log
{
    //  Returns the log level preceded by the appropriate icon
    enum LogLevel
    {
        case info
        case warning
        case error
        
        fileprivate var prefix: String
        {
            switch self
            {
                case .info: return "ℹ️ INFO"
                case .warning: return "⚠️ WARN"
                case .error: return "🛑 ERROR"
            }
        }
    }
    
    // Returns the logging description in file name: line number -> function format
    struct Context
    {
        let file: String
        let function: String
        let line: Int
        
        var description: String
        {
            return "\((file as NSString).lastPathComponent):\(line) → Function: \(function)"
        }
    }
    
    //  Handles info level logging information
    static func info(_ descriptionString: String, file: String = #file, function: String = #function, line: Int = #line)
    {
        let context = Context(file: file, function: function, line: line)
        
        Log.handleLog(level: .info, outputString: descriptionString, context: context)
    }
    
    //  Handles warning level logging information
    static func warning(_ descriptionString: String, file: String = #file, function: String = #function, line: Int = #line)
    {
        let context = Context(file: file, function: function, line: line)
        
        Log.handleLog(level: .warning, outputString: descriptionString, context: context)
    }
    
    //  Handles error level logging information
    static func error(_ descriptionString: String, file: String = #file, function: String = #function, line: Int = #line)
    {
        let context = Context(file: file, function: function, line: line)
        
        Log.handleLog(level: .error, outputString: descriptionString, context: context)
    }
    
    //  Prints logging information to the console in debug mode
    fileprivate static func handleLog(level: LogLevel, outputString: String, context: Context)
    {
        let logComponents = ["[\(level.prefix)]", outputString]
        
        #if DEBUG
        print(logComponents.joined(separator: " ") + " → \(context.description)")
        #endif
    }
}
