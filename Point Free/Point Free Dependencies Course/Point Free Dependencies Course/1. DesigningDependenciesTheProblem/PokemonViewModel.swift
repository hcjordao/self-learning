//
//  PokemonViewModel.swift
//  Point Free Dependencies Course
//

import Combine
import Foundation

@Observable
final class PokemonViewModel {
    private(set) var pokemons: [PokemonEntry] = []
    private(set) var isConnected: Bool

    private var pokemonClient: PokemonClientProtocol
    private var pokemonRequestCancellable: AnyCancellable?
    
    init(
        isConnected: Bool = true,
        pokemonClient: PokemonClientProtocol = PokemonClient()
    ) {
        self.isConnected = isConnected
        self.pokemonClient = pokemonClient
        
        self.pokemonRequestCancellable = pokemonClient
            .pokemons()
            .sink(
                receiveCompletion: { value in
                    print(value)
                },
                receiveValue: { [weak self] pokemons in
                    self?.pokemons = pokemons
                }
            )
    }
}
