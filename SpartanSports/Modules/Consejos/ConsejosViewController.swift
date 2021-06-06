//
//  ConsejosViewController.swift
//  SpartanSports
//
//  Created by MAC on 1/6/21.
//


import UIKit

protocol ConsejosViewControllerProtocol {
    
}

class ConsejosViewController: BaseViewController<ConsejosPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    @IBOutlet weak var myTableViewConsejos: UITableView!
    var tableviewManager : TableViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getData()
        tableviewManager = TableViewManager(tableView: myTableViewConsejos, presenter: presenter)
        
    }
    
}

extension ConsejosViewController: ConsejosViewControllerProtocol {
    
    
}
