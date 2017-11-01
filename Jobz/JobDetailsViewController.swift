//
//  JobDetailsViewController.swift
//  Jobz
//
//  Created by Mohammad Shahzaib Ather on 2017-10-21.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

import UIKit

class JobDetailsViewController : UICollectionViewController , UICollectionViewDelegateFlowLayout {

    private let cellid = "cellid"
    private let headerId = "headId"
    private let descriptionCellid = "descriptioncellid"
    
    var job : JobDetailsCell? {
        didSet {
            self.navigationItem.title = job?.jobNameLabel.text
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(jobDetailHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView?.register(PhotoJobDetailCell.self, forCellWithReuseIdentifier: cellid)
        collectionView?.register(jobDetailDescriptionCell.self, forCellWithReuseIdentifier: descriptionCellid)
      
    }
   
// Functions that are needed to follow the protocol of the collectionview
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

     //  return collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionCellid, for: indexPath) as! jobDetailDescriptionCell
           
        //    cell.textView.attributedText = descriptionAttributedText()
            return cell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! PhotoJobDetailCell
        
        return cell

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }

    
//    func descriptionAttributedText() -> NSAttributedString {
//        let attributedText = NSMutableAttributedString(string: "Description \n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)])
//        
//        let style = NSParagraphStyle()
//        style.lineSpacing = 10
//        
//        let range = NSMakeRange(0, attributedText.string.characters.count)
//      //  attributedText.addAttributes(NSParagraphStyleAttributeName, range: range)
//        attributedText.addAttribute(NSParagraphStyleAttributeName, value: <#T##Any#>, range: <#T##NSRange#>)
//
//        
//        return attributedText
//    }
//    
    
    
// Building out header view for job details controller 
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! jobDetailHeaderCell
        
        header.job = job
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
}


// Creating the header cell for the job detail cell


class jobDetailHeaderCell : BaseCell {
   
    var job : JobDetailsCell? {
        didSet {
            if let jobImage = job?.profileImageView.image {
           imageView.image = jobImage
            }
            nameLabel.text = job?.jobNameLabel.text
            descriptionLabel.text = job?.jobDescriptionLabel.text
        }
    }
    
    let imageView : UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let segmentedController: UISegmentedControl = {
      let sc = UISegmentedControl(items: ["Details","Reviews","Related"])
        sc.tintColor = UIColor.darkGray
        return sc
        
    }()
    
    let nameLabel: UILabel = {
       let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 16)
      //  nameLabel.text = "Hollywood Actress"
        return nameLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descripLabel = UILabel()
        descripLabel.font = UIFont.systemFont(ofSize: 14)
        descripLabel.lineBreakMode = .byWordWrapping
        descripLabel.numberOfLines = 0
        return descripLabel
    }()
   
    let applyButton : UIButton = {
        let apButton = UIButton(type: .system)
        apButton.backgroundColor = UIColor.green
        apButton.layer.cornerRadius = 16
        apButton.setTitle("APPLY", for: .normal)
        return apButton
    }()
    
    let dividerLineView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews(){
        super.setupViews()
        addSubview(imageView)
        addSubview(segmentedController)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(applyButton)
        addSubview(dividerLineView)

        backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
      
        addConstraintsWithFormat(format: "H:|-20-[v0(150)]-10-[v1]", views: imageView,nameLabel)
        addConstraintsWithFormat(format: "V:|-12-[v0(150)]-30-[v1]", views: imageView,segmentedController)
        addConstraintsWithFormat(format: "V:|-12-[v0(30)]-5-[v1]", views: nameLabel,descriptionLabel)
        addConstraintsWithFormat(format: "H:|-180-[v0]", views: descriptionLabel)
        addConstraint(NSLayoutConstraint.init(item: imageView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
        addConstraintsWithFormat(format: "H:|-40-[v0]-40-|", views: segmentedController)
        addConstraintsWithFormat(format: "H:|-180-[v0(170)]", views: applyButton)
        addConstraintsWithFormat(format: "V:|-120-[v0(40)]", views: applyButton)
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:[v0(0.5)]|", views: dividerLineView)
        
    }
}

class jobDetailDescriptionCell: BaseCell {
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = "Description"
        return textView
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(textView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: textView)
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-|", views: textView)
    }
}







