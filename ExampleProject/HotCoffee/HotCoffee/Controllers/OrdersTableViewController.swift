//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by WANKI KIM on 2021/11/30.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        guard let coffeeURL = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeURL)
        
        WebService().load(resource: resource) { [weak self] result in
            switch result {
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        let vm = orderListViewModel.orderViewModel(at: indexPath.row)
        
        cell.textLabel?.text = vm.name
        cell.detailTextLabel?.text = vm.coffeeName
        
        return cell
    }
}
