import UIKit

struct Owner: Codable {
    var name: String
    var purchaseDate: Int
}

struct Car: Codable {
    var year: Int
    var model: String
    var brand: String
    var owner: Owner
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let owner_1 = Owner(name: "Nadia Barbosa", purchaseDate: 2012)
        let car = Car(year: 2010, model: "BMW", brand: "330i", owner: owner_1)
        
        // Encoding to JSON
        let jsonEncoder = JSONEncoder()
        let encodedJson = try! jsonEncoder.encode(car)
        let encodedString = String(bytes: encodedJson, encoding: .utf8)
        print(encodedString!)
        
        // Decoding to data structure
        let jsonDecoder = JSONDecoder()
        let decodedJson = try! jsonDecoder.decode(Car.self, from: encodedJson)
        print(decodedJson)
        print(decodedJson.owner)
    }
}

