//
//  AnasayfaProtocols.swift
//  NobetciEczane
//
//  Created by Sedat Samet Oypan on 10.12.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView: PresenterToViewAnasayfaProtocol? {get set}
    
    func ara(ilText:String)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func eczaneAra(ilText:String)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(eczaneListesi:[Result])
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(eczaneListesi:[Result])
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaViewController)
}
