//
//  PhotoCellJobDetail.swift
//  Jobz
//
//  Created by Mohammad Shahzaib Ather on 2017-10-31.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

import Foundation
import UIKit

class PhotoJobDetailCell: BaseCell , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let dividerLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
   private let cellid = "cellid"
    
    override func setupViews() {
        super.setupViews()
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
        addSubview(dividerLineView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0][v1(0.5)]|", views: collectionView, dividerLineView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLineView)
        collectionView.register(photoImageCell.self, forCellWithReuseIdentifier: cellid)
    }
    
 // Functions that are needed to follow the protocol of the collectionview
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //  Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 10)
    }
    
// Class for creating the images for the job detail controller , images of the job and the job environment 
    
    private class photoImageCell : BaseCell {
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        override func setupViews() {
            super.setupViews()
            addSubview(imageView)
            backgroundColor = UIColor.lightGray
            addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
            addConstraintsWithFormat(format: "V:|[v0]|", views: imageView)
            
        }
    }
    
}



