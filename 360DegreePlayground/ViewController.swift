//
//  ViewController.swift
//  360DegreePlayground
//
//  Created by BRAEDON LARSEN on 2/9/23.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewOutlet: UIImageView!
    var secondFloor2D: [[Picture]] = []
    var secondFloor: [Picture] = [Picture(i: "360ImageTest1", x: 0, y: 0), Picture(i: "360ImageTest2", x: 1, y: 0), Picture(i: "360ImageTest3", x: 2, y: 0), Picture(i: "360ImageTest4", x: 3, y: 0),Picture(i: "360ImageTest1", x: 4, y: 0),Picture(i: "360ImageTest2", x: 5, y: 0),Picture(i: "360ImageTest3", x: 6, y: 0),Picture(i: "360ImageTest4", x: 7, y: 0),Picture(i: "360ImageTest0", x: 8, y: 0),Picture(i: "360ImageTest1", x: 9, y: 0)]
    var xValue = 0
    var yValue = 0

// Method for navigating between images is a 2D array of images with buttons to update the active index which stores the images and specific indexes
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondFloor2D[0][0] = Picture(i: "360ImageTest1", x: 0, y: 0)
        
        updateImage(i: xValue)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func upArrowAction(_ sender: Any) {
        updateImage(i: 1)
    }
    
    @IBAction func leftArrowAction(_ sender: Any) {
        
    }
    
    @IBAction func downArrowAction(_ sender: Any) {
        updateImage(i: -1)
    }
    
    @IBAction func rightArrowAction(_ sender: Any){
        
    }
    
    @IBAction func panAction(_ sender: Any) {
        
    }
    func updateImage(i: Int)
    {
        print(xValue)
        print(yValue)
        imageViewOutlet.image = UIImage(named: secondFloor[xValue + i].image)
        xValue = secondFloor[xValue + i].xCord
    }
    func create2D()
    {
        secondFloor2D[0][0] = Picture(i: "0,0", x: 0, y: 0)
        secondFloor2D[1][0] = Picture(i: "1,0", x: 1, y: 0)
    }
    
}


