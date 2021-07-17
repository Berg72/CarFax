//
//  CarListCell.swift
//  CarFax
//
//  Created by Mark bergeson on 7/15/21.
//

import UIKit

class CarListCell: UITableViewCell {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
//    @IBOutlet weak var makelabel: UILabel!
//    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
//    @IBOutlet weak var milesLabel: UILabel!
//    @IBOutlet weak var locationLabel: UILabel!

    func configure(carlist: CarList) {
        API.shared.getImage(urlString: carlist.baseUrl.medium) { data in
            guard let data = data else {
                self.carImage.image = nil
                return
        }
            
            let image = UIImage(data: data)
            self.carImage.image = image
        
        }
        
        yearLabel.text = "\(carlist.year)"; "\(carlist.make)"; "\(carlist.model)"
        priceLabel.text = "\(carlist.listprice) | "; "\(carlist.mileage) | "; "\(carlist.city) , "; "\(carlist.state)"
    }
   
    
    
}
