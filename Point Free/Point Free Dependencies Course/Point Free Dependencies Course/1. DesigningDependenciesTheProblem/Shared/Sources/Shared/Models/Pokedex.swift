import Foundation

public struct Pokedex {
    public let region: String
    public let pokemons: [Pokemon]
    
    public init(region: String, pokemons: [Pokemon]) {
        self.region = region
        self.pokemons = pokemons
    }
}

public extension Pokedex {
    static func mock(
        region: String = "Kanto",
        pokemons: [Pokemon] = [Pokemon.mock(), Pokemon.mock(), Pokemon.mock(), Pokemon.mock()]
    ) -> Self {
        .init(
            region: region,
            pokemons: pokemons
        )
    }
}
