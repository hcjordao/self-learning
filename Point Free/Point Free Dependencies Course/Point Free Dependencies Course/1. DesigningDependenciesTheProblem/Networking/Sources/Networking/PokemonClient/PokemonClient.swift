import Shared

public struct PokemonClient: Sendable {
    public typealias PokemonProvider = @Sendable () async throws -> [PokemonEntry]
    public typealias RegionsProvider = @Sendable () async throws -> [PokemonRegion]
    
    public var pokemons: PokemonProvider
    public var regions: RegionsProvider
    
    public init(
        pokemons: @escaping PokemonProvider,
        regions: @escaping RegionsProvider
    ) {
        self.pokemons = pokemons
        self.regions = regions
    }
}
