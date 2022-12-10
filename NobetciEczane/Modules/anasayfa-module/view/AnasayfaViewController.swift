//
//  AnasayfaViewController.swift
//  NobetciEczane
//
//  Created by Sedat Samet Oypan on 10.12.2022.
//

import UIKit
import Alamofire
import Kingfisher
class AnasayfaViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var eczaneListesi = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
    }
    
    @IBAction func araButtonClicked(_ sender: Any) {
    }
    
}

extension AnasayfaViewController {
    func eczaneBul(ilText:String, ilceText:String) {
        let headers: HTTPHeaders = ["Authorization":"apikey 6gd8WZyEtkuXKUWsL8tzcf:0R3rz7mIbNbTvLyJojOsDR",
                                    "Content-Type":"application/json"]
        let params:Parameters = ["il":ilText,"ilce":ilceText]
        AF.request("https://api.collectapi.com/health/dutyPharmacy", method: .get,parameters: params,headers: headers).response { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(SonucModel.self, from: data)
                    let liste = result.result
                    for eczane in liste {
                        print(eczane.name)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension AnasayfaViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eczane = eczaneListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EczaneTableViewCell") as! EczaneTableViewCell
        DispatchQueue.main.async {
            cell.setupCell(eczane: eczane)
        }
        return cell
    }
    
    
}
