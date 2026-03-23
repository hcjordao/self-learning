import Shared

public struct PokemonClient: Sendable {
    public typealias PokedexProvider = @Sendable (Int) async throws -> Pokedex
    public typealias RegionsProvider = @Sendable () async throws -> [PokemonRegion]
    
    public var pokedex: PokedexProvider
    public var regions: RegionsProvider
    
    public init(
        pokedex: @escaping PokedexProvider,
        regions: @escaping RegionsProvider
    ) {
        self.pokedex = pokedex
        self.regions = regions
    }
}
