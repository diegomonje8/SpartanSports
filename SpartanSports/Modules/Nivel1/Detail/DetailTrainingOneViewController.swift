//
//  DetailTrainingOneViewController.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import UIKit

protocol DetailTrainingOneViewControllerProtocol {
    
}


class DetailTrainingOneViewController: BaseViewController<DetailTrainingOnePresenterProtocol>, ReuseIdentifierInterfaceViewController {

    @IBOutlet weak var detailTableView: UITableView!
    var tableviewManager : TableViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getData()
        tableviewManager = TableViewManager(tableView: detailTableView, presenter: presenter)
    }

}

extension DetailTrainingOneViewController : DetailTrainingOneViewControllerProtocol {
    
}
