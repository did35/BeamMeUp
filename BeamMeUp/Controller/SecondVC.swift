//
//  SecondVC.swift
//  BeamMeUp
//
//  Created by Didier Delhaisse on 01/01/2019.
//  Copyright © 2019 Didier Delhaisse. All rights reserved.
//

import UIKit

// 1. Create a protocol ( a contract where the func receivedData(data:) MUST be implemented, who ever will be the delegate for this method).
protocol CanReceive {
    func receivedData(data: String?)
}

class SecondVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var data: String?
    // 4. Create a property which is optional as the delegate can be nil.
    // In this case, the delegate which will pass will be the FirstVC.
    // The delegate method is of type the protocol.
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
        // The delegate in this case is the FirstVC (line 31 in the prepare(for segue:) method).
        delegate?.receivedData(data: textField.text)
        self.dismiss(animated: true, completion: nil)
    }
}
