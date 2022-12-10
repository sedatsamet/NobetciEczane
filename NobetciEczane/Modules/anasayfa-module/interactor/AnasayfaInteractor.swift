//
//  AnasayfaInteractor.swift
//  NobetciEczane
//
//  Created by Sedat Samet Oypan on 10.12.2022.
//

import Foundation
import Alamofire

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func eczaneAra(ilText: String) {
        let headers: HTTPHeaders = ["Authorization":"apikey 6gd8WZyEtkuXKUWsL8tzcf:0R3rz7mIbNbTvLyJojOsDR",
                                    "Content-Type":"application/json"]
        //let params:Parameters = ["il":ilText,"ilce":ilceText]
        let params:Parameters = ["il":ilText]
        AF.request("https://api.collectapi.com/health/dutyPharmacy", method: .get,parameters: params,headers: headers).response { response in
            if let data = response.data {
                do {
                    let gelenSonuc = try JSONDecoder().decode(SonucModel.self, from: data)
                    if let liste = gelenSonuc.result {
                        self.anasayfaPresenter?.presenteraVeriGonder(eczaneListesi: liste)
                    }
                }catch{
                    self.anasayfaPresenter?.presenteraVeriGonder(eczaneListesi: [])
                    print(error.localizedDescription)
                }
            }
        }
    }
}
