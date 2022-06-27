import UIKit
import FirebaseCore
import Firebase
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        GMSPlacesClient.provideAPIKey(self.apiKey)
        return true
    }
    
}

//MARK: - Get Api Keys from Keys.plist
extension AppDelegate {
    private var apiKey: String {
           get {
               guard let filePath = Bundle.main.path(forResource: "GooglePlacesKeys", ofType: "plist") else {
                   fatalError("Couldn't find file 'GooglePlacesKeys.plist'.")
               }
               let plist = NSDictionary(contentsOfFile: filePath)
               guard let value = plist?.object(forKey: "GooglePlacesKey") as? String else {
                   fatalError("Couldn't find key 'GooglePlacesKey' in 'Keys.plist'.")
               }
               if (value.starts(with: "_")) {
                   print("Register for a Google Cloud Platform developer account and get an API key at https://developers.google.com/maps/documentation/places/ios-sdk/cloud-setup")
               }
               return value
           }
       }
}
