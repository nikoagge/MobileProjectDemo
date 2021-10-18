//
//  BookShelfCollectionViewCell.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 18/10/21.
//

import UIKit

class BookShelfCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    static let nibName = "BookShelfCollectionViewCell"
    static let identifier = "BookShelfCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
