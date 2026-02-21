import Combine
import Shared

public struct PokemonClient {
    public var pokemons: () -> AnyPublisher<[PokemonEntry], any Error>
    public var regions: () -> AnyPublisher<[PokemonRegion], any Error>
    
    public init(
        pokemons: @escaping () -> AnyPublisher<[PokemonEntry], any Error>,
        regions: @escaping () -> AnyPublisher<[PokemonRegion], any Error>
    ) {
        self.pokemons = pokemons
        self.regions = regions
    }
}
