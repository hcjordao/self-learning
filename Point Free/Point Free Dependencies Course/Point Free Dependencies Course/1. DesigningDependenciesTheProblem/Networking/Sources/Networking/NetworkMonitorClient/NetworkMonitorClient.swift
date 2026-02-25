import Foundation
import Network

public struct NetworkMonitorClient: Sendable {
    public typealias NetworkPathUpdatesProvider = @Sendable () -> AsyncStream<NetworkPath>
    
    public var networkPathUpdates: NetworkPathUpdatesProvider
    
    public init(networkPathUpdates: @escaping NetworkPathUpdatesProvider) {
        self.networkPathUpdates = networkPathUpdates
    }
}
