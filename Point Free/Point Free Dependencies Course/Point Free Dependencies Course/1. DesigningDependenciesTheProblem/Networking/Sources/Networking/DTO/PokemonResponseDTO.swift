import Foundation
import Shared

public struct PokedexResponseDTO: Decodable {
    public let pokemonEntries: [PokemonEntry]
    
    public struct PokemonEntry: Decodable {
        public let entryNumber: Int
        public let pokemonSpecies: PokemonSpecies
        
        enum CodingKeys: String, CodingKey {
            case entryNumber = "entry_number"
            case pokemonSpecies = "pokemon_species"
        }
        
        public struct PokemonSpecies: Decodable {
            public let name: String
            public let url: String
            
            public init(name: String, url: String) {
                self.name = name
                self.url = url
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case pokemonEntries = "pokemon_entries"
    }
}

public extension Pokedex {
    init(_ dto: PokedexResponseDTO) {
        self.init(
            region: "TBD",
            pokemons: dto.pokemonEntries.map(Pokemon.init)
        )
    }
}

public extension Pokemon {
    init(_ dto: PokedexResponseDTO.PokemonEntry) {
        let components = dto.pokemonSpecies.url
            .trimmingCharacters(in: CharacterSet(charactersIn: "/"))
            .components(separatedBy: "/")
        let pokedexId = Int(components.last ?? "0") ?? 0
        
        self.init(
            entryId: dto.entryNumber,
            pokedexId: pokedexId,
            name: dto.pokemonSpecies.name
        )
    }
}
