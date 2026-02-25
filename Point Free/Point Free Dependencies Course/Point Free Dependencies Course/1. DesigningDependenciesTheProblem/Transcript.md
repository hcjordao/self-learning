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
    var _pokemons: () -> AnyPublisher<[PokemonEntry], Error>
    var _regions:  () -> AnyPublisher<[PokemonRegion], Error> 

    func pokemons() -> AnyPublisher<[PokemonEntry], Error> {
        _pokemons()
    }

    func regions() -> AnyPublisher<[PokemonRegion], Error> {
        _regions()
    }
}
```

# Designing Dependencies: Modularization

For the times that a protocol is not sufficiently abstracting away some functionality, which is most evident in those cases where we only have 1 or 2 conformances, it can be advantageous to scrap the protocols and just use a simple, concrete data type. That is basically what this MockWeatherClient type is now.

## Migrating from a protocol based dependency into a concrete data type based one

For this to be achieved we will use a struct which has functions as variables and create static lets which will be our conformances:

``` swift
struct SomeDependency {
    var someApiCall: () -> AnyPublisher<[SomeType], Error>
    var someApiCall2: () -> AnyPublisher<[SomeType2], Error>
}

extension SomeDependency {
    static let live = Self(
        someApiCall: {
            // Implementation Details
        },
        someApiCall2: {
            // Implementation Details
        }
    )
}
```

Pros: 
1. Since the conformances become value types we can apply transformations to them just as you would in a Array/Dictionary/..., so we can just override a value easily with mocked data (just access the value and change the closure).
2. This is not available with protocol conformances, I can't just easily change a conformance of a protocol and change the value of it because they are created functions (protocols have functions)
3. Very lightweight and you can easily change values  

## Using frameworks to further modularize our dependencies

Using packages / frameworks to modularize increases our application's maintainability by isolating code ensures the package does not depend or care about the implementation. On Swift, using packages is the way to go, having a package also improves compilation time, because if the anything the compiled package depends on has not changed then the package itself should not need to be compiled once again.

### Further improving compilation

As this moment of implementation all of the package code lives inside the package: Interface + Live + Mock. However, both interface and mock are compiled much faster as it normally do not depend in third party or heavy code to be compiled. The live code normally will depend in external 3rd party code which will impact compilation time by a lot.


## How would this work in a async/await problem?

HCJ: TBD

# Designing Dependencies: Reachability

## Wrapping types into our own

When using external dependencies every so ofter we will come across types which we can't construct.

To solve this we need to wrap these external types into our own types.

```swift
// Can't access NWPath.Status

struct NetworkPath {
    var status: NWPath.Status
}

extension NetworkPath {
    init(rawValue: NWPath) {
        self.status = rawValue.status
    }
}
```  

> ⚠️ Investigate the dependencies in order to be able to extract functionality into proper functions. Check what the function is returning. Take calm looks in order to decide how to wrap this dependency functionality into a struct
