//
//  EczaneTableViewCell.swift
//  NobetciEczane
//
//  Created by Sedat Samet Oypan on 10.12.2022.
//

import UIKit
import Kingfisher

class EczaneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eczaneImageView: UIImageView!
    @IBOutlet weak var eczaneAdLabel: UILabel!
    @IBOutlet weak var eczaneIlceLabel: UILabel!
    @IBOutlet weak var eczaneTelefonLabel: UILabel!
    
    private let eczaneGifUrl = URL(string: "https://www.amasyaeo.org.tr/wp-content/themes/gambit/images/eczane.gif")
    private var counter : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(eczane:Result) {
        self.eczaneImageView.kf.setImage(with: self.eczaneGifUrl)
        self.eczaneAdLabel.text = "\(eczane.name!) ECZANESİ"
        self.eczaneIlceLabel.text = "İLÇE: \(eczane.dist!)"
        self.eczaneTelefonLabel.text = "Telefon: 0 \(telefonAlanKoduAyır(telefon: eczane.phone!))"
    }
    
    func telefonAlanKoduAyır(telefon:String) -> String {
        let formattedPhoneNumber = telefon.applyPatternOnNumbers(pattern: "(###) ###-##-##", replacementCharacter: "#")
        return formattedPhoneNumber
    }
    
}
