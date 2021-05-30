//
//  MenuViewController.swift
//  SpartanSports
//
//  Created by MAC on 30/5/21.
//

import UIKit

protocol MenuViewControllerProtocol {
    
}

class MenuViewController: BaseViewController<MenuPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var myTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableview.reloadData()
        self.myTableview.register(UINib(nibName: HeaderTableViewCell.defaultResuseIdentifier, bundle: nil), forCellReuseIdentifier: HeaderTableViewCell.defaultResuseIdentifier)
        self.myTableview.register(UINib(nibName: BodyTableViewCell.defaultResuseIdentifier, bundle: nil), forCellReuseIdentifier: BodyTableViewCell.defaultResuseIdentifier)
    }
    
    private func setupTableView() {
        self.myTableview.delegate = self
        self.myTableview.dataSource = self
    }
    
}

extension MenuViewController: MenuViewControllerProtocol {
    
    
}

extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return self.presenter?.getNumberOfRowsInSection() ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = self.myTableview.dequeueReusableCell(withIdentifier: HeaderTableViewCell.defaultResuseIdentifier, for: indexPath) as! HeaderTableViewCell
            if let modelData = presenter?.getInformationObject(indexPath: indexPath.row) {
                cell.configCell(data: modelData)
                return cell
            }
            else {
               return UITableViewCell()
            }
            
        default:
            let cell = self.myTableview.dequeueReusableCell(withIdentifier: BodyTableViewCell.defaultResuseIdentifier, for: indexPath) as! BodyTableViewCell
            cell.delegate = self
            if let modelData = presenter?.getInformationObject(indexPath: indexPath.row) {
                cell.configCell(data: modelData)
                return cell
            }
            else {
               return UITableViewCell()
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 180
        default: return 44
        }
    }
    
}

extension MenuViewController : BodyTableViewCellDelegate {
    func sendToVC(data: Menu?) {
        if let data = data {
            print("Tap on \(data.literal ?? "Tapped but menu not found")")
        }
    }
    
    
    
    
}
