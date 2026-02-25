import Foundation
import Network

public struct NetworkPath {
    public var status: NWPath.Status
}

public extension NetworkPath {
    init(rawValue: NWPath) {
        self.status = rawValue.status
    }
}
