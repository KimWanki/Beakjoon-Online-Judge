//
//  CustomTableViewCell.swift
//  TableViewLazyLoading
//
//  Created by Luyan on 2021/08/12.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var rowLabel: UILabel!
    @IBOutlet weak var customImage: UIImageView!
    
    override func prepareForReuse() {
        self.backgroundColor = .white
        sectionLabel.text = nil
        rowLabel.text = nil
        customImage.image = nil
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url,completionHandler: completion).resume()
    }
    
    func loadImage(from url: URL, indexPath: IndexPath) {
        getData(from: url) { [self] data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                [weak self] in
                self?.customImage.image = UIImage(data: data)
            }
        }
    }
}
