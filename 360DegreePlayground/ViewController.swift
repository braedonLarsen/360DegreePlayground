//
//  ViewController.swift
//  360DegreePlayground
//
//  Created by BRAEDON LARSEN on 2/9/23.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var debugDataOutlet: UILabel!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    var ARRAY_SIZE_X = 6
    var ARRAY_SIZE_Y = 6
    var currentArray = 0
    var secondFloor2DNorth = [[Picture]](repeating:[Picture]() , count: 7)
    //var secondFloor: [Picture] = [Picture(i: "360ImageTest1", x: 0, y: 0), Picture(i: "360ImageTest2", x: 1, y: 0), Picture(i: "360ImageTest3", x: 2, y: 0), Picture(i: "360ImageTest4", x: 3, y: 0),Picture(i: "360ImageTest1", x: 4, y: 0),Picture(i: "360ImageTest2", x: 5, y: 0),Picture(i: "360ImageTest3", x: 6, y: 0),Picture(i: "360ImageTest4", x: 7, y: 0),Picture(i: "360ImageTest0", x: 8, y: 0),Picture(i: "360ImageTest1", x: 9, y: 0)]
    var xValue = 0
    var yValue = 0
    var cardinalDirection = 0 

// Method for navigating between images is a 2D array of images with buttons to update the active index which stores the images and specific indexes
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //secondFloor2D[0][0] = Picture(i: "360ImageTest1", x: 0, y: 0)
        create2D()
        updateImage(i: xValue, j: yValue)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func upArrowAction(_ sender: Any) {
        updateImage(i: 1, j:0)
    }
    
    @IBAction func leftArrowAction(_ sender: Any) {
        updateImage(i: 0, j: -1)
    }
    
    @IBAction func downArrowAction(_ sender: Any) {
        updateImage(i: -1, j: 0)
    }
    
    @IBAction func rightArrowAction(_ sender: Any){
        updateImage(i: 0, j: 1)
    }
    
    @IBAction func panAction(_ sender: Any) {
        
    }
    
    @IBAction func rotateLeft(_ sender: Any) {
        rotateImage(w:-1)
        
    }
    
    @IBAction func rotateRight(_ sender: Any) {
        rotateImage(w:1)
    }
    
    
    
    func rotateImage(w: Int)
    {
        if cardinalDirection == 3 && w > 0
        {
            cardinalDirection = 0
        }
        else if cardinalDirection == 0 && w < 0
        {
            cardinalDirection = 3
        }
        else
        {
            cardinalDirection += w
        }
        
    }
    func updateImage(i: Int, j: Int)
    {
        print("X:\(xValue)")
        print("Y:\(yValue)")
        print("J: \(j)")
        if xValue + i <= ARRAY_SIZE_X && xValue + i >= 0
        {  xValue += i
            print("test1")
        }
        if yValue + j <= ARRAY_SIZE_Y && yValue + j >= 0
        {  yValue += j
            print("test2")
        }
        var tempImage = secondFloor2DNorth[xValue][yValue]
        print("Cardinal Direction: \(cardinalDirection)")
        if cardinalDirection == 0
        {
            imageViewOutlet.image = secondFloor2DNorth[xValue][yValue].imageNorth
            print("displayNorth")
        }
        else if cardinalDirection == 1
        {
            imageViewOutlet.image = secondFloor2DNorth[xValue][yValue].imageEast
            print("displayEast")
        }
        else if cardinalDirection == 2
        {
            imageViewOutlet.image = secondFloor2DNorth[xValue][yValue].imageSouth
            print("displaySouth")
        }
        else if cardinalDirection == 3
        {
            imageViewOutlet.image = secondFloor2DNorth[xValue][yValue].imageWest
            print("displayWest")
        }
        print("isWhiteSpace \(secondFloor2DNorth[xValue][yValue].whiteSpace)")
        print("Reported X and Y:  \(xValue) , \(yValue)")
        print("Image Value:  \(tempImage.image)")
        
        
        
        
        
   
        
        
//            imageViewOutlet.image = UIImage(named: secondFloor[xValue + i].image)
//        xValue = secondFloor[xValue + i].xCord
        
    }
//    func printData()
//    {
//        var output = "Cords: \(secondFloor2DNorth[xValue][yValue].image) \ \(secondFloor2DNorth[xValue][yValue].whiteSpace)"
//    }
    func create2D()
    {
        var i = 0
        var j = 0
        while (i <= ARRAY_SIZE_X)
        {
            j = 0
            var littleArray = [Picture]()
            while (j <= ARRAY_SIZE_Y)
            {
                print("Create New Object")
                var inString = "\(i),\(j)"
                var imN = UIImage(named: "N\(inString)")
                var imW = UIImage(named: "W\(inString)")
                var imE = UIImage(named: "E\(inString)")
                var imS = UIImage(named: "S\(inString)")
                print("inString: \(inString)")
                var isEmpty = false
                if imN == nil
                {
                    imN = UIImage(named: "def")
                    print("North Default")
                    isEmpty = true
                }
                if imW == nil
                {
                    imW = UIImage(named: "def")
                    print("West Default")
                    isEmpty = true
                }
                if imE == nil
                {
                    imE = UIImage(named: "def")
                    print("East Default")
                    isEmpty = true
                }
                if imS == nil
                {
                    imS = UIImage(named: "def")
                    print("South Default")
                    isEmpty = true
                    
                }
                print(isEmpty)
                littleArray.append(Picture(i: inString, x: i, y: j,wS: isEmpty, iN: imN! ,iE: imE!, iW: imW!, iS: imS! ))
    
                print("LITTLE: \(littleArray[j].image)")
                print("Nums: \(i),\(j)")
                //print(secondFloor2D[i][j].image)
                j += 1
            }
            secondFloor2DNorth[i].append(contentsOf: littleArray)
            i += 1
        }
      
        func checkImage(p: Picture)
        {
            if UIImage(named: p.image) != nil
            {
                p.whiteSpace = true
            }
        }
        

        
    }
    
}


