//
//  SecondVC.swift
//  BeamMeUp
//
//  Created by Didier Delhaisse on 01/01/2019.
//  Copyright © 2019 Didier Delhaisse. All rights reserved.
//

import UIKit

// 1. Create a protocol
protocol CanReceive {
    func receivedData(data: String?)
}

class SecondVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var data: String?
    // 4. Create a property which is optional.
    var delegate: CanReceive?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let data = data else { return }
        label.text = data
    }
    
    @IBAction func sendDataBackPushed(_ sender: Any) {
        // 5. 
        // The ? after delegate is called optional chaining, an alternative of optional binding.
        // What it does is if the delegate is not nil, it calls the receivedData() func, otherwise it ignores what is after the . syntax.
        delegate?.receivedData(data: textField.text)
        self.dismiss(animated: true, completion: nil)
    }
}
