import Shared

public struct PokemonClient: Sendable {
    public var pokemons: @Sendable () async throws -> [PokemonEntry]
    public var regions: @Sendable () async throws -> [PokemonRegion]
    
    public init(
        pokemons: @escaping @Sendable () async throws -> [PokemonEntry],
        regions: @escaping @Sendable () async throws -> [PokemonRegion]
    ) {
        self.pokemons = pokemons
        self.regions = regions
    }
}
