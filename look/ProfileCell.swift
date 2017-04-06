//
//  ProfileCell.swift
//  look
//
//  Created by Nick Hoyt on 4/6/17.
//  Copyright © 2017 IntelliSkye. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell{
    
    
   
    
    @IBOutlet var imageV: UIImageView!
    
    @IBOutlet var latlngLbl: UILabel!
    
    @IBOutlet var dateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // let tap = UITapGestureRecognizer(target: self, action: #selector(TableViewCell.celebNameTapped))
        //  celebName.addGestureRecognizer(tap)
    }
    /*
     func celebNameTapped(sender: UITapGestureRecognizer) {
     print("bigButtonTapped")
     FundraiserScreen.performSegue(withIdentifier: "toCelebProfile", sender: self)
     }
     */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.frame = CGRectMake(8, 25, 70, 70)
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    
    
}
