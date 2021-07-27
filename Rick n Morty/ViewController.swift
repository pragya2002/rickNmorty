//
//  ViewController.swift
//  Rick n Morty
//
//  Created by Pragya Awasthi on 26/07/21.
//

import UIKit

class ViewController: UIViewController {

    static var na="character name"
    @IBOutlet weak var table: UITableView!
    let cells=["Rick Sanchez","Evil Morty"]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate=self
        table.dataSource=self
        
    }
    
     func getData(from url:String) {
    URLSession.shared.dataTask(with:URL(string:url)!,completionHandler:{data,response,error in
        guard let data=data,error==nil else{
            print("something went wrong")
            return
        }

        var result:respon?
        do{
            result=try JSONDecoder().decode(respon.self,from:data)
        }
        catch{
            print("failed to convert \(error.localizedDescription)")
            debugPrint(error)

        }
        guard let json=result else{
            return
        }
       
        ViewController.na=json.results[sel].name
      
       
    }).resume()
    }
    override func prepare(for segue:UIStoryboardSegue,sender:Any?)
    {
        var sec=segue.destination as! second
        sec.n1=ViewController.na
        print(ViewController.na)
       
    }
    
//    struct respon:Codable {
//        var info:someInfo
//        var results:[MyResult]
//    }
//
//    struct someInfo:Codable {
//        var count:Int
//        var pages:Int
//        var next:URL
//        var prev:URL
//
//    }
//
//
//
//    struct MyResult:Codable{
//        var id:Int
//        var name:String
//        var status:String
//        var species:String
//        var gender:String
//        var origin:OriginDeets
//        var location:LocationDeets
//        var image:URL
//        var episode:[URL]
//        var url:URL
//        var created:String
//    }
//    struct OriginDeets:Codable{
//        var name:String
//        var url:URL
//
//    }
//
//    struct LocationDeets:Codable{
//        var name:String
//        var url:URL
//    }

    
    struct respon: Codable {
        let info: Info
        let results: [Result]
    }

    // MARK: - Info
    struct Info: Codable {
        let count, pages: Int
        let next: String
        let prev: JSONNull?
    }

    // MARK: - Result
    struct Result: Codable {
        let id: Int
        let name: String
        let status: Status
        let species: Species
        let type: String
        let gender: Gender
        let origin, location: Location
        let image: String
        let episode: [String]
        let url: String
        let created: String
    }

    enum Gender: String, Codable {
        case female = "Female"
        case male = "Male"
        case unknown = "unknown"
    }

    // MARK: - Location
    struct Location: Codable {
        let name: String
        let url: String
    }

    enum Species: String, Codable {
        case alien = "Alien"
        case human = "Human"
    }

    enum Status: String, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }
    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }

  
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        sel=indexPath.row
        let url="https://rickandmortyapi.com/api/character"
        getData(from: url)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
 
  
      
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=table.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        let ch=cells[indexPath.row]
        cell.avtrImg.image=UIImage(named: ch)
        cell.charName.text=ch
        cell.number.text="0"+String(indexPath.row+1)
        
        return cell
    }
    
        
    }

