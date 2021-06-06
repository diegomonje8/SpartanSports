//
//  DetalleConsejosViewController.swift
//  SpartanSports
//
//  Created by MAC on 6/6/21.
//

import UIKit


protocol DetalleConsejosViewControllerProtocol {
    
}

class DetalleConsejosViewController: BaseViewController<DetalleConsejosPresenterProtocol>, ReuseIdentifierInterfaceViewController  {

    @IBOutlet weak var myDetalleConsejosTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    private func setUpTableView() {
        self.myDetalleConsejosTableview.delegate = self
        self.myDetalleConsejosTableview.dataSource = self
        
        self.myDetalleConsejosTableview.register(DetalleConsejosCell.nib, forCellReuseIdentifier: DetalleConsejosCell.identifier)
    }
}

extension DetalleConsejosViewController : DetalleConsejosViewControllerProtocol {
    
}

extension DetalleConsejosViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myDetalleConsejosTableview.dequeueReusableCell(withIdentifier: DetalleConsejosCell.identifier, for: indexPath) as! DetalleConsejosCell
        if let modelData = self.presenter?.informationForItem(indexPath: indexPath.row) {
            cell.configCell(data: modelData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
