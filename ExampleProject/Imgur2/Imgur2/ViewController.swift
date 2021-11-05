//
//  ViewController.swift
//  Imgur2
//
//  Created by WANKI KIM on 2021/08/17.
//

import UIKit

class ViewController: UIViewController {
    var viewCollectionMode = true
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imgurs = [Imgur]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.getImgurs { (response) in
            self.imgurs = response.imgurs
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func barButton(_ sender: UIBarButtonItem) {
        viewCollectionMode.toggle()
        self.collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgurs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgurCell", for: indexPath) as? ImgurCell else { return UICollectionViewCell() }
        
        cell.configure(with: imgurs[indexPath.item])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize.zero }

        var bounds = collectionView.bounds
        bounds.size.height += bounds.origin.y

        var width = bounds.width - (layout.sectionInset.left + layout.sectionInset.right)
        var height = bounds.height - (layout.sectionInset.top + layout.sectionInset.bottom)
        if viewCollectionMode {
            width = (width - (layout.minimumInteritemSpacing * 2)) / 3
            height = (height - (layout.minimumLineSpacing * 4)) / 5
        } else {
            height = (height - (layout.minimumLineSpacing * 1)) / 2
        }
        
        return CGSize(width: width.rounded(.down), height: height.rounded(.down))
    }
}

