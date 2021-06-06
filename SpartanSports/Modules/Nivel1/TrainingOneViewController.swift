//
//  TrainingOneViewController.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import UIKit

protocol TrainingOneViewControllerProtocol {
    func fetchhDataFromPresent()
}

class TrainingOneViewController: BaseViewController<TrainingOnePresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    @IBOutlet weak var trainingOneTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading(view: self.view, animated: true)
        configureTableview()
        self.menuButton()
        self.presenter?.fetchTraining()
        
    }
    
    private func configureTableview() {
        trainingOneTableView.delegate = self
        trainingOneTableView.dataSource = self
        
        trainingOneTableView.register(UINib(nibName: TrainingOneCell.defaultResuseIdentifier, bundle: nil), forCellReuseIdentifier: TrainingOneCell.defaultResuseIdentifier)
    }
    
}

extension TrainingOneViewController: TrainingOneViewControllerProtocol {
    internal func fetchhDataFromPresent() {
        hideLoading(view: self.view, animated: true)
        trainingOneTableView.reloadData()
    }
    
    
    
}

extension TrainingOneViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trainingOneTableView.dequeueReusableCell(withIdentifier: TrainingOneCell.defaultResuseIdentifier, for: indexPath) as! TrainingOneCell
        if let model = presenter?.getInformationObject(indexPath: indexPath.row) {
            cell.configCell(data: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showDetail(position: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    
}
