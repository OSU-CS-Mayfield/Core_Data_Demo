//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Blayne Mayfield on 2/15/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var deptAbbr: UITextField!
    @IBOutlet weak var courseNum: UITextField!
    @IBOutlet weak var courseTitle: UITextField!
    
    var deptAbbrResult = ""
    var courseNumResult: Int16 = 0
    var courseTitleResult = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        deptAbbrResult = deptAbbr.text ?? "Bad DeptAbbr"
        courseNumResult = Int16(courseNum.text ?? "-1")!
        courseTitleResult = courseTitle.text ?? "Bad Title"
    }
}


