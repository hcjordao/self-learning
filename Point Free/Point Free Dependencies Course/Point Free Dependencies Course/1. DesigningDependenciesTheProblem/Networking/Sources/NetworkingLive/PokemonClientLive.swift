import Foundation
import Networking
import Shared

@MainActor
public extension PokemonClient {
    static let live = PokemonClient(
        pokemons: {
            let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let dto = try JSONDecoder().decode(PokemonResponseDTO.self, from: data)
            return PokemonEntry.mapToDomain(dto)
        },
        regions: {
            fatalError("Not implemented yet")
        }
    )
}

public let __tmp0 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp1 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp2 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp3 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp4 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp5 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp6 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp7 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp8 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp9 = 2 * 2 * 2 * 2.0 / 2 + 2

public let __tmp10 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp11 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp12 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp13 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp14 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp15 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp16 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp17 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp18 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp19 = 2 * 2 * 2 * 2.0 / 2 + 2

public let __tmp20 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp21 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp22 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp23 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp24 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp25 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp26 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp27 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp28 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp29 = 2 * 2 * 2 * 2.0 / 2 + 2

public let __tmp30 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp31 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp32 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp33 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp34 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp35 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp36 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp37 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp38 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp39 = 2 * 2 * 2 * 2.0 / 2 + 2

public let __tmp40 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp41 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp42 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp43 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp44 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp45 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp46 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp47 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp48 = 2 * 2 * 2 * 2.0 / 2 + 2
public let __tmp49 = 2 * 2 * 2 * 2.0 / 2 + 2
