//
//  ViewController.swift
//  TableViewLazyLoading
//
//  Created by Luyan on 2021/08/12.
//

import UIKit

class ViewController: UIViewController {
    let imageURL = ["https://wallpaperaccess.com/download/europe-4k-1369012",
                    "https://wallpaperaccess.com/download/europe-4k-1318341",
                    "https://wallpaperaccess.com/download/europe-4k-1379801"]
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "section \(section)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else { fatalError() }
        
        guard let imageURL = URL(string: imageURL[indexPath.row]) else { fatalError() }
        URLSession.shared.dataTask(with: URLRequest(url: imageURL)) { data, response, error in
            guard let data = data, error == nil else { return }
            let image = UIImage(data: data) // main 에서 하지 말기
            DispatchQueue.main.async {
                if indexPath == tableView.indexPath(for: cell) {
                    cell.customImage.image = image
                }
            }
        }.resume()
        
        
        if indexPath.row == 2 {
            cell.backgroundColor = .red
        }
        
        if indexPath.section <= 3 {
            cell.sectionLabel.text = "\(indexPath.section)행"
            cell.rowLabel.text = "\(indexPath.row)열"
        }
        return cell
    }
}


