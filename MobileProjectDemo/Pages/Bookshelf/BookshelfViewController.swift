//
//  BookshelfViewController.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 17/9/21.
//

import UIKit

class BookshelfViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let booksAr = NetworkClient.shared.getBooks(accessToken: "T1amGT21.Idup.298885bf38e99053dca3434eb59c6aa")
    }
}
