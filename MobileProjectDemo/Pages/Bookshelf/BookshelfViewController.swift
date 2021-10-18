//
//  BookshelfViewController.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 17/9/21.
//

import UIKit
import SDWebImage

class BookshelfViewController: UIViewController {
    @IBOutlet weak var bookShelfCollectionView: UICollectionView!
    
    private var booksArray = [BooksResponse]()
    private let inset: CGFloat = 15
    private let cellsPerRow = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        callServices(accessToken: UserDefaults.standard.string(forKey: "accessToken") ?? "")
    }
}

extension BookshelfViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let bookShelfCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BookShelfCollectionViewCell.identifier, for: indexPath) as? BookShelfCollectionViewCell {
//            bookShelfCollectionViewCell.bookImageView.sd_setImage(with: URL(string: booksArray[indexPath.row].imageURL ?? ""))
            bookShelfCollectionViewCell.bookTitleLabel.text = booksArray[indexPath.row].title ?? ""
            
            return bookShelfCollectionViewCell
        }
        
        return UICollectionViewCell()
    }
}

private extension BookshelfViewController {
    func setupUI() {
        bookShelfCollectionViewConfiguration()
    }
    
    func callServices(accessToken: String) {
        booksArray = NetworkClient.shared.getBooks(accessToken: accessToken)!
    }
    
    func bookShelfCollectionViewConfiguration() {
        let flowLayout = UICollectionViewFlowLayout()
        let totalSpace = inset * 3 + (CGFloat(cellsPerRow - 1))
        let size = Int((UIScreen.main.bounds.width - totalSpace) / CGFloat(cellsPerRow))
        flowLayout.itemSize = CGSize(width: size, height: size)
        bookShelfCollectionView.collectionViewLayout = flowLayout

        bookShelfCollectionView.showsHorizontalScrollIndicator = false
//        localNewsCollectionView.dataSource = self
//        localNewsCollectionView.delegate = self
        bookShelfCollectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        bookShelfCollectionView.isScrollEnabled = false
        bookShelfCollectionView.register(UINib(nibName: BookShelfCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: BookShelfCollectionViewCell.identifier)
    }
}
