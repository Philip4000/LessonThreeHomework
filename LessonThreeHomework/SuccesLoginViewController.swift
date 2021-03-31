//
//  SuccesLoginViewController.swift
//  LessonThreeHomework
//
//  Created by Philip Noskov on 30.03.2021.
//

import UIKit

class SuccesLoginViewController: UIViewController {

    @IBOutlet weak var userNameLable: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLable.text = userName 
    }
    
    @IBAction func closeButton() {
        dismiss(animated: true)
    }
    
}
