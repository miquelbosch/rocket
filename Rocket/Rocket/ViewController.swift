//
//  ViewController.swift
//  Rocket
//
//  Created by Miquel Bosch on 13/02/2021.
//

import UIKit
import RocketLogic

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let test = TestMath()
        test.printText()
    }
}
