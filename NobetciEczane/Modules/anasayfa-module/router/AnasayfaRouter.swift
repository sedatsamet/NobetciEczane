//
//  AnasayfaRouter.swift
//  NobetciEczane
//
//  Created by Sedat Samet Oypan on 10.12.2022.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaViewController) {
        let presenter = AnasayfaPresenter()
        
        ref.anasayfaPresenterDelegate = presenter
        
        ref.anasayfaPresenterDelegate?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterDelegate?.anasayfaView = ref
        
        ref.anasayfaPresenterDelegate?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
}
