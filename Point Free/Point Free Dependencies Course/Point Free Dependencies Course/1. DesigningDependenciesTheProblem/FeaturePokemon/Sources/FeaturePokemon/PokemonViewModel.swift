import Foundation
import CoreLocation
import Network
import Networking
import Shared

@Observable
@MainActor
public final class PokemonViewModel: NSObject {
    private(set) var pokedex: Pokedex?
    private(set) var isNationalPokedex = true
    private(set) var isConnected = true

    private let networkMonitor: NetworkMonitorClient
    private let pokemonClient: PokemonClient
    private let manager = CLLocationManager()
    
    public init(
        networkMonitor: NetworkMonitorClient,
        pokemonClient: PokemonClient
    ) {
        self.networkMonitor = networkMonitor
        self.pokemonClient = pokemonClient
        
        super.init()
        
        manager.delegate = self
    }
    
    func fetchPokedex(withRegion regionId: Int) async {
        pokedex = nil
        
        do {
            pokedex = try await pokemonClient.pokedex(regionId)
        } catch {
            print(error)
        }
    }
    
    func startMonitoring() async {
        for await path in networkMonitor.networkPathUpdates() {
            isConnected = path.status == .satisfied
            
            if isConnected {
                await fetchPokedex(withRegion: 2)
            } else {
                pokedex = nil
            }
        }
    }
    
    func locationButtonTapped() {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            // TODO: Show an alert
            break
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
            
        @unknown default:
            break
        }
    }
}

extension PokemonViewModel: CLLocationManagerDelegate {
    public nonisolated func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            break
        case .denied, .restricted:
            // TODO: Show an alert with another description
            break
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()
        @unknown default:
            break
        }
    }
    
    public nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        // TODO: HCJ: Next steps:
        /*
         1. Fetch pokemon regions -> Populate internal mock Location/Manager Dependency (get a lat/long -> Map into a region after fetching)
         2. If no location display nothing
         3. If permission given get location coordinate from core location and call our internal dependency to get an region
         4. Get Pokedex with region
         5. Move what was learned into transcript: Core Location Issues (nonisolated) + Issues with Core Location + previews and simulator
         */

        Task { @MainActor in
            await fetchPokedex(withRegion: 2)
        }
    }
    
    public nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        // TODO: HCJ: Implement error
        debugPrint("Failed to call location")
    }
}
