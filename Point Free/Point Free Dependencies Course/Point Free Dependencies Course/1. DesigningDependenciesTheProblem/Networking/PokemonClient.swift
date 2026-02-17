//
//  PokemonAPI.swift
//  Point Free Dependencies Course
//

import Combine
import Foundation

protocol PokemonClientProtocol {
    func pokemons() -> AnyPublisher<[PokemonEntry], Error>
    func regions() -> AnyPublisher<[PokemonRegion], Error>
}

struct PokemonClient: PokemonClientProtocol {
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0")!
    
    func pokemons() -> AnyPublisher<[PokemonEntry], any Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { data, _ in
                print(data)
                return data
            }
            .decode(type: PokemonResponseDTO.self, decoder:  JSONDecoder())
            .map { response in
                print(response)
                return PokemonEntry.mapToDomain(from: response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func regions() -> AnyPublisher<[PokemonRegion], any Error> {
        Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

struct MockPokemonClient: PokemonClientProtocol {
    var _pokemons: () -> AnyPublisher<[PokemonEntry], any Error>
    var _regions: () -> AnyPublisher<[PokemonRegion], any Error>
    
    func pokemons() -> AnyPublisher<[PokemonEntry], any Error> {
        _pokemons()
    }
    
    func regions() -> AnyPublisher<[PokemonRegion], any Error> {
        _regions()
    }
}
