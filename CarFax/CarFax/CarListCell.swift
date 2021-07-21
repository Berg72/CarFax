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
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    private var phone: String?
    


    func configure(carlist: CarList) {
        phone = carlist.dealer.phone
        API.shared.getImage(url: carlist.images.firstPhoto.medium) { data in
            guard let data = data else {
                self.carImage.image = nil
                return
        }
            
            let image = UIImage(data: data)
            self.carImage.image = image
        
        }
        
        yearLabel.text = "\(carlist.year) \(carlist.make) \(carlist.model)"
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let amount = formatter.string(from: NSNumber(floatLiteral: carlist.listPrice)) ?? "$0.00"
        
        let attributedAmount = NSMutableAttributedString(string: amount, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0, weight: .semibold)])
        attributedAmount.append(NSAttributedString(string: " | \(carlist.mileage)K MI | \(carlist.dealer.city ?? " "), \(carlist.dealer.state ?? " ")", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0, weight: .regular)]))
        
//        priceLabel.text = "\(amount) | \(carlist.mileage)K MI | \(carlist.dealer.city ?? " "), \(carlist.dealer.state ?? " ")"
        priceLabel.attributedText = attributedAmount
        
        callButton.setTitle(format(with: "(XXX) XXX-XXXX", phone: carlist.dealer.phone ?? " "), for: .normal)
    }
   
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                
                result.append(numbers[index])

                
                index = numbers.index(after: index)

            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    @IBAction func callButtonAction(_ sender: Any) {
    


        if let url = URL(string: "tel://\(phone ?? " ")"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        return
    }
    
}
