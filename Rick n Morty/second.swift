//
//  second.swift
//  Rick n Morty
//
//  Created by Pragya Awasthi on 27/07/21.
//

import UIKit

class second: UIViewController {
    @IBOutlet weak var av: UIImageView!
    @IBOutlet weak var nm: UILabel!
    
    
    
    @IBOutlet weak var stat: UILabel!
    
    @IBOutlet weak var ori: UILabel!
    
    @IBOutlet weak var gen: UILabel!

    var n1:String?=nil
    
    @IBOutlet weak var las: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        nm.text=n1
       
        
       
    }
    

    
  
}
