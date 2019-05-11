// Copyright (c) 2019 Nomad5. All rights reserved.

import Foundation
import os.log

/// Class for logging
class Log {

    /// Log at debug level
    @inline(__always) static func d(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        #if DEBUG
            log("D", OSLogType.debug, message, file, line)
        #endif
    }

    /// Log at info level
    @inline(__always) static func i(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        #if DEBUG
            log("I", OSLogType.info, message, file, line)
        #endif
    }

    /// Log at default log level
    @inline(__always) static func l(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        #if DEBUG
            log("L", OSLogType.default, message, file, line)
        #endif
    }

    /// Log at warning level
    @inline(__always) static func f(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        log("F", OSLogType.fault, message, file, line)
    }

    /// Log at error level
    @inline(__always) static func e(_ message: String, _ file: String = #file, _ line: UInt = #line) {
        log("E", OSLogType.error, message, file, line)
    }

    /// Internal formatting function
    @inline(__always) static func log(_ prefix: String, _ type: OSLogType, _ message: String, _ file: String, _ line: UInt) {
        os_log("%@%@| %@:%i: %@", type: type, Thread.isMainThread ? "+" : "-", prefix, file, line, message)
    }

}