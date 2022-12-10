//
//  AnasayfaPresenter.swift
//  NobetciEczane
//
//  Created by Sedat Samet Oypan on 10.12.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func ara(ilText: String) {
        anasayfaInteractor?.eczaneAra(ilText: ilText)
    }
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(eczaneListesi: [Result]) {
        anasayfaView?.vieweVeriGonder(eczaneListesi: eczaneListesi)
    }
}
