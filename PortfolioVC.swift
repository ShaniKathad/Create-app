//
//  ProfileVC.swift
//  Janki-Demo
//
//  Created by admin on 6/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class PortfolioVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet var collV : UICollectionView!
    var arrUserPortfolio = [UserportfolioModal]()


    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        
        guard let url = URL(string: self.arrUserPortfolio[indexPath.row].portfolio_image) else { return cell }
        
        let data = try? Data(contentsOf: url)
        
        if let data = data, let image = UIImage(data: data) {
            cell.imgV.image = image
        }
        
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrUserPortfolio.count
    }
   
    @IBAction func backButtonClicked(){
        
        self.dismiss(animated: true, completion: nil)
    }
}

