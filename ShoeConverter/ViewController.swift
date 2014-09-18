//
//  ViewController.swift
//  ShoeConverter
//
//  Created by Daniel Gilbert on 9/18/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtShoeSize: UITextField!
    @IBOutlet weak var lblConvertedShoeSize: UILabel!
    @IBOutlet weak var tglGender: UISwitch!
    @IBOutlet weak var tglConversionType: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnConvertMensShoeSize(sender: UIButton) {
        let MENS_EU_CONVERSION:Double = 30.5
        let WOMENS_EU_CONVERSION:Double = 31
        
        var shoeSize = Double((txtShoeSize.text as NSString).doubleValue)
        var strConversion:String
        
        txtShoeSize.resignFirstResponder()
        lblConvertedShoeSize.hidden = false
        lblConvertedShoeSize.textColor = UIColor.redColor()
        
        // Toggle conversion logic based on switches
        if (tglConversionType.on){ // US to EU
            strConversion = "EU Shoe Size: \t"
            if (tglGender.on) { // Male
                strConversion += "\(shoeSize + MENS_EU_CONVERSION)"
            }else{ // Female
                strConversion += "\(shoeSize + WOMENS_EU_CONVERSION)"
            }
        }else{ // EU to US
            strConversion = "US Shoe Size: \t"
            if (tglGender.on) { // Male
                strConversion += "\(shoeSize - MENS_EU_CONVERSION)"
            }else{ // Female
                strConversion += "\(shoeSize - WOMENS_EU_CONVERSION)"
            }
        }
        
        
        lblConvertedShoeSize.text = strConversion
    }
}

