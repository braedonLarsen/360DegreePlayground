//
//  ViewController.swift
//  360DegreePlayground
//
//  Created by BRAEDON LARSEN on 2/9/23.
//
import UIKit

class ViewController: UIViewController {

    
    

    var secondFloor: [Picture] = [Picture(i: "360Test", x: 0, y: 0), Picture(i: "370Test", x: 1, y: 0)]
    var xValue = 0
    var yValue = 0
    
// Method for navigating between images is a 2D array of images with buttons to update the active index which stores the images and specific indexes
    
    
    override func viewDidLoad() {
            
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func upArrowAction(_ sender: Any) {
        
    }
    
    @IBAction func leftArrowAction(_ sender: Any) {
        
    }
    
    @IBAction func downArrowAction(_ sender: Any) {
        
    }
    
    @IBAction func rightArrowAction(_ sender: Any){
        
    }
    
    @IBAction func panAction(_ sender: Any) {
        
    }
    
    
}

