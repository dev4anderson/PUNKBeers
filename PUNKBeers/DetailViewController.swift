//
//  DetailViewController.swift
//  PUNKBeers
//
//  Created by Anderson Macedo on 18/07/17.
//  Copyright © 2017 Anderson Macedo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblTagline: UILabel!

    @IBOutlet weak var txtDesc: UITextView!

    @IBOutlet weak var lblAbv: UILabel!

    @IBOutlet weak var lblIbu: UILabel!

    @IBOutlet weak var ivPicture: UIImageView!

    
    // MARK: - Properties
    
    var beer: Beer!
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        drawBeer()
    }
    
    func loadImage(_ url: String){
        let api = RequestApi()
        api.requestPicture(url: url) { response in
            self.ivPicture.image = response
        }
    }
    
    func drawBeer(){
        if let name = beer.name {
            lblName.text = name
        }
        
        if let tagline = beer.tagline {
            lblTagline.text = tagline
        }
        
        if let description = beer.description {
            txtDesc.text = description
        }
        
        if let alcohol = beer.abv {
            lblAbv.text = "\(alcohol)"
        }
        
        if let ibu = beer.ibu {
            lblIbu.text = "\(ibu)"
        }
        
        if let url = beer.imageUrl {
            loadImage(url)
        }
        
    }
    
}
