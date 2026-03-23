import Foundation

public struct Pokemon: Identifiable {
    public let entryId: Int
    public let pokedexId: Int
    public let name: String

    public init(
        entryId: Int,
        pokedexId: Int,
        name: String
    ) {
        self.entryId = entryId
        self.pokedexId = pokedexId
        self.name = name
    }
    
    public var id: Int {
        entryId
    }
    
    public var displayName: String {
        name.capitalized
    }
}

public extension Pokemon {
    static func mock(
        entryId: Int = 1,
        pokedexId: Int = 1,
        name: String = "bulbassaur"
    ) -> Self {
        .init(
            entryId: entryId,
            pokedexId: pokedexId,
            name: name
        )
    }
}
