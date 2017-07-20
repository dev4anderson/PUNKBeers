//
//  BeerTableViewCell.swift
//  PUNKBeers
//
//  Created by Anderson Macedo on 18/07/17.
//  Copyright © 2017 Anderson Macedo. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var ivPicture: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblAlcohol: UILabel!

    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
    func loadImage(_ url: String){
        let api = RequestApi()
        api.requestPicture(url: url) { response in
            self.ivPicture.image = response
        }
    }
    
    func drawBeer(_ beer: Beer){
        
        if let url = beer.imageUrl {
            loadImage(url);
        }
        
        if let name = beer.name {
            lblDesc.text = name
        }
        
        if let alcohol = beer.abv {
            lblAlcohol.text = "Teor Alcoólico: \(alcohol)"
        }
    }
    
}
