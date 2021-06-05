//
//  AlertDefaultViewConttrollerViewController.swift
//  SpartanSports
//
//  Created by MAC on 1/6/21.
//

import UIKit

@objc protocol AlertDefaultViewControllerDelegate : AnyObject {
    @objc optional func defaultPrimaryButtonPressed(type: DefaultAlertType)
    @objc optional func defaultSecondaryButtonPressed(type: DefaultAlertType)
}


class AlertDefaultViewController: UIViewController {

    weak var delegate : AlertDefaultViewControllerDelegate?
    var type: DefaultAlertType?
    var viewModel : DefaultAlertViewModel?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var secondatyButton: UIButton!
    @IBOutlet weak var constraintButtonPrimaryToBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }

    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.defaultSecondaryButtonPressed?(type: self.type ?? .none)
        }
    }
    
    @IBAction func primaryButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.defaultPrimaryButtonPressed?(type: self.type ?? .none)
        }
    }
    
    
    @IBAction func SecondaryButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.defaultSecondaryButtonPressed?(type: self.type ?? .none)
        }
    }
    
    private func initUI() {
        switch viewModel?.type {
        case .confirmationNavigation:
            self.lblTitle.text = viewModel?.confirmationTitle
            self.lblMessage.text = viewModel?.confirmationMessage
            self.primaryButton.setTitle(viewModel?.confirmationPrimaryButton, for: .normal)
            self.secondatyButton.setTitle(viewModel?.confirmationSecondaryButton, for: .normal)
            self.constraintButtonPrimaryToBottom.constant = 20
        default:
            self.lblTitle.text = ""
            self.lblMessage.text = ""
            self.primaryButton.setTitle("", for: .normal)
        }
        
    }
}
