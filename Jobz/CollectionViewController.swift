//
//  CollectionViewController.swift
//  Jobz
//
//  Created by Mohammad Shahzaib Ather on 2017-10-15.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cellid"

class CollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Home"
        
        
        collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(JobDetailsCell.self, forCellWithReuseIdentifier: "Cellid")
        collectionView?.alwaysBounceVertical = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: "Cellid", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView.cellForItem(at: indexPath) != nil){
            let layout = UICollectionViewFlowLayout()
            let jobDetailsController = JobDetailsViewController(collectionViewLayout: layout)
            jobDetailsController.job = JobDetailsCell()
            navigationController?.pushViewController(jobDetailsController, animated: true)
            
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

//
class JobDetailsCell: BaseCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 34
        return imageView
    }()
    
    let dividerLineView : UIView = {
        let dividerlineView = UIView()
        dividerlineView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return dividerlineView
    }()
    
    let jobNameLabel : UILabel = {
        let jobNL = UILabel()
        jobNL.text = "Software Developer"
        jobNL.font = UIFont.systemFont(ofSize: 18)
        return jobNL
    }()
    
    let jobDescriptionLabel : UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = UIColor.darkGray
        descriptionLabel.text = "Job description goes here"
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        return descriptionLabel
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.text = "12:30 pm"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let hasAppliedImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "done")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    override func setupViews() {
        backgroundColor = UIColor.white
        addSubview(profileImageView)
        addSubview(dividerLineView)
        setupContainerView()
        
        profileImageView.image = UIImage(named: "monet")
        addConstraintsWithFormat(format: "H:|-12-[v0(68)]|", views: profileImageView)
        addConstraintsWithFormat(format:"V:[v0(58)]" , views: profileImageView)
        addConstraint(NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.centerY , relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
        
        addConstraintsWithFormat(format:"H:|-82-[v0]|" , views: dividerLineView)
        addConstraintsWithFormat(format:"V:[v0(1)]|" , views: dividerLineView)
        
        
    }
    
    private func setupContainerView(){
        let containerView = UIView()
        addSubview(containerView)
        addConstraintsWithFormat(format: "H:|-90-[v0]|", views: containerView)
        addConstraintsWithFormat(format: "V:[v0(60)]", views: containerView)
        addConstraint(NSLayoutConstraint(item: containerView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute:NSLayoutAttribute.centerY , multiplier: 1, constant: 0))
        
        containerView.addSubview(jobNameLabel)
        containerView.addSubview(jobDescriptionLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(hasAppliedImageView)
        
        addConstraintsWithFormat(format: "H:|[v0][v1(80)]-12-|", views: jobNameLabel,timeLabel)
        addConstraintsWithFormat(format: "V:|[v0][v1(24)]|", views: jobNameLabel,jobDescriptionLabel)
        addConstraintsWithFormat(format: "H:|[v0]-8-[v1(20)]-12-|", views: jobDescriptionLabel, hasAppliedImageView)
        addConstraintsWithFormat(format: "V:|[v0(20)]", views: timeLabel)
        addConstraintsWithFormat(format: "V:[v0(20)]|", views: hasAppliedImageView)
    }
    
}




// Extension for UIView Constraints so less code is being used


extension UIView {
    
    
    
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format , options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary ))
    }
}

class BaseCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
    }
}

