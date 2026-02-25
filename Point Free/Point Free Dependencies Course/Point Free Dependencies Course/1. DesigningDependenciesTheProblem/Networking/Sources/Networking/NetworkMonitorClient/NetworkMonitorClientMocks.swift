import Foundation

@MainActor
public extension NetworkMonitorClient {
    static let alwaysConnected = Self(
        networkPathUpdates: {
            AsyncStream { continuation in
                continuation.yield(NetworkPath(status: .satisfied))
            }
        }
    )
    
    static let neverConnected = Self(
        networkPathUpdates: {
            AsyncStream { continuation in
                continuation.yield(NetworkPath(status: .unsatisfied))
            }
        }
    )
    
    static func flaky(initialDelay: Duration = .seconds(2)) -> Self {
        NetworkMonitorClient(
            networkPathUpdates: {
                AsyncStream { continuation in
                    continuation.yield(NetworkPath(status: .satisfied))
                    Task {
                        try? await Task.sleep(for: initialDelay)
                        continuation.yield(NetworkPath(status: .unsatisfied))
                        try? await Task.sleep(for: initialDelay)
                        continuation.yield(NetworkPath(status: .satisfied))
                    }
                }
            }
        )
    }
}
