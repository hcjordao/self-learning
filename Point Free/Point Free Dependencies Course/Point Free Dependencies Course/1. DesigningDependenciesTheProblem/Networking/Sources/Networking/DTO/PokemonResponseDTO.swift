import Foundation
import Shared

public struct PokemonResponseDTO: Decodable {
    public let results: [PokemonEntry]
    
    public struct PokemonEntry: Decodable {
        public let name: String
        public let url: String
        
        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }
}

public extension PokemonEntry {
    static func mapToDomain(_ dto: PokemonResponseDTO) -> [Self] {
        dto.results.map(Self.init)
    }
    
    init(_  dto: PokemonResponseDTO.PokemonEntry) {
        let components = dto.url.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
                    .components(separatedBy: "/")
        let id = Int(components.last ?? "0") ?? 0
        
        self.init(
            id: id,
            name: dto.name
        )
    }
}
