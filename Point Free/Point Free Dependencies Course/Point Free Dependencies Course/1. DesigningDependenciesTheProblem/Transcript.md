# Designing Dependencies: The Problem

## What is a dependency?
Dependencies are frameworks which our code __depends__ on to run. Such as network clients, alamo fire, web socket frameworks, analytics & etc

When left uncheck they can wreck havoc to the code base.

Problems regarding unchecked dependencies:
1. They can increase compilation time of the project.
    - First build time will require us to build all dependencies
    - Branch switching will probably require us to rebuild all dependencies
    - If clean is used, then we will rebuild every thing
    - When code is merged to main, xcode can lose itself and need to rebuild itself
2. Cause stress on Apple Tools: Such as Previews or Playgrounds can stop working or take a long time to solve themselves.
3. Difficulty to test

## Dependencies as Protocols
According to the Point Free team, using protocols to abstract the interface of getting data only generated two conformances: a live one which fetches real data and a mock which returns mocked data synchronously.

**A protocol which only abstracts 2 types of conformances is not a strong abstraction**

If we look at Apple's protocol abstraction there is not a single one which abstracts only two types of behaviours. For example, sequences abstracts multiples behaviours.

We could create more conformances such as: Live, HappyPath, Empty, Failure. But this is a lot of code and it is resistant to changes, any changes to the protocol will cascade into many other changes in all protocols.

So a solution for this is to have a single Mock Depedency which allows for customization through storing values inside it.

``` swift
struct MockPokemonClient: PokemonClientProtocol {
    var _pokemons: AnyPublisher<[PokemonEntry], Error>
    var _regions: AnyPublisher<[PokemonRegion], Error> 

    func pokemons() -> AnyPublisher<[PokemonEntry], Error> {
        _pokemons
    }

    func regions() -> AnyPublisher<[PokemonRegion], Error> {
        _regions
    }
}
```