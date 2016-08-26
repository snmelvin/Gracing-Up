//
//  MissionStatementViewController.swift
//  Gracing Up
//
//  Created by Jake Shor on 6/20/16.
//  Copyright © 2016 ERP Resources. All rights reserved.
//

import Foundation
import UIKit

class MissionStatementViewController: UIViewController {
    @IBOutlet weak var missionStatement: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        missionStatement.lineBreakMode = .ByWordWrapping
        missionStatement.numberOfLines = 0;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
}