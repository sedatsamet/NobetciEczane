//
//  AnasayfaViewController.swift
//  NobetciEczane
//
//  Created by Sedat Samet Oypan on 10.12.2022.
//

import UIKit

class AnasayfaViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var eczaneListesi = [Result]()
    var anasayfaPresenterDelegate : ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCurrentDay()
        setupTableView()
        setupNavigationBar()
        
        AnasayfaRouter.createModule(ref: self)
    }
    
    private func showCurrentDay(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        formatter.timeZone = TimeZone(abbreviation: "UTC+3")!
        formatter.locale = Locale(identifier: "tr-TR")
        
        let utcTimeZoneStr = formatter.string(from: date)
        tarihLabel.text = "\(utcTimeZoneStr) Tarihli Nöbetçi Eczaneler"
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .singleLine
    }
    
    private func setupNavigationBar(){
        self.navigationItem.title = "Nöbetçi Eczane Ara"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor:UIColor.red, .font:UIFont(name: "Roboto-Black", size: 25)!]
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @IBAction func araButtonClicked(_ sender: Any) {
        if let aramaKelimesi = searchBar.text {
            anasayfaPresenterDelegate?.ara(ilText: aramaKelimesi)
        }
    }
    
}
// MARK: Reloading Data with Search Response
extension AnasayfaViewController : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(eczaneListesi: [Result]) {
        self.eczaneListesi = eczaneListesi
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: TableView Delegate & DataSource
extension AnasayfaViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eczaneListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eczane = eczaneListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EczaneTableViewCell", for: indexPath) as! EczaneTableViewCell
        DispatchQueue.main.async {
            cell.setupCell(eczane: eczane)
        }
        return cell
    }
}
