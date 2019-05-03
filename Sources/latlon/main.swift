import CoreLocation

func errorAndExit(msg: String) {
    stderrln(msg: msg)
    exit(1)
}

func stderrln(msg: String) {
    fputs("\(msg)\n", stderr)
}

class Latlon: NSObject, CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let loc = locations.first!
        print("{\n  \"latitude\": \(loc.coordinate.latitude),\n  \"longitude\": \(loc.coordinate.longitude)\n}")
        exit(0)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        errorAndExit(msg: error.localizedDescription)
    }
}

let latlon = Latlon()
let locationManager = CLLocationManager()
locationManager.desiredAccuracy = kCLLocationAccuracyBest
locationManager.delegate = latlon
locationManager.startUpdatingLocation()

RunLoop.main.run(until: Date.init(timeIntervalSinceNow: 30))
errorAndExit(msg: "timeout")
