//
//  FirstVC.swift
//  BeamMeUp
//
//  Created by Didier Delhaisse on 01/01/2019.
//  Copyright © 2019 Didier Delhaisse. All rights reserved.
//

import UIKit

// 2. Comform to the declared protocol
class FirstVC: UIViewController, CanReceive {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        textField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataForwards" {
            let dest = segue.destination as! SecondVC
            dest.data = textField.text
            // 6. Set the delegate for the protocol as this VC.
            dest.delegate = self
        }
    }
    
    // 3. Implement the required func from the protocol
    func receivedData(data: String?) {
        guard let data = data else { return }
        label.text = data
    }    
}

