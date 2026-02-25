import Network
import Networking

@MainActor
public extension NetworkMonitorClient {
    static let live = Self(
        networkPathUpdates: {
            AsyncStream { continuation in
                let monitor = NWPathMonitor()
                
                monitor.pathUpdateHandler = { path in
                    continuation.yield(NetworkPath(rawValue: path))
                }
                
                continuation.onTermination = { _ in
                    monitor.cancel()
                }
                
                monitor.start(queue: .main)
            }
        }
    )
}
