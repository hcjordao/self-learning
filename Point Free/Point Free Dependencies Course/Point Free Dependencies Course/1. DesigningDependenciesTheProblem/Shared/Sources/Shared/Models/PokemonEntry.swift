import Foundation

public struct PokemonEntry: Identifiable {
    public let id: Int
    public let name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    public var displayName: String {
        name.capitalized
    }
}

public extension PokemonEntry {
    static func mockPokemonList() -> [Self] {
        [.mock(), .mock(), .mock(), .mock()]
    }
    
    static func mock(
        id: Int = 1,
        name: String = "bulbassaur"
    ) -> Self {
        .init(id: id, name: name)
    }
}
