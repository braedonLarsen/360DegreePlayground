//
//  ViewController.swift
//  360DegreePlayground
//
//  Created by BRAEDON LARSEN on 2/9/23.
//
import UIKit
class AppData: Codable
{
    static var ARRAY_SIZE_X = 6
    static var ARRAY_SIZE_Y = 6
    static var secondFloor2DNorth = [[Picture]](repeating:[Picture]() , count: 7)
    static var twoDDataArray = [[DataPicture]](repeating:[DataPicture]() , count: 7)
   
    static var didUpdate = false
}
class ViewController: UIViewController {

    @IBOutlet weak var imageViewOutlet: UIImageView!
   // AppData.twoDDataArray[0][0] = DataPicture(i: "4", x: 3, y: 2, wSN: true, wSE: true, wSS: true, wSW: true, iN: Data(), iE: Data(), iW: Data(), iS: Data())
    

    var currentArray = 0

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
        rotateImage(w: 0)
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
            if AppData.secondFloor2DNorth[xValue][yValue].whiteSpaceNorth == false
            {
                cardinalDirection = 0
            }
        }
        else if cardinalDirection == 0 && w < 0
        {
            if AppData.secondFloor2DNorth[xValue][yValue].whiteSpaceWest == false
            {
                cardinalDirection = 3
            }
        }
        else
        {
            cardinalDirection += w
        }
    }
    func updateImage(i: Int, j: Int)
    {
        if AppData.didUpdate
        {
            update2D()
            AppData.didUpdate = false
            
        }
        var xCheck = false
        var yCheck = false
        print("X:\(xValue)")
        print("Y:\(yValue)")
        print("J: \(j)")
        if xValue + i <= AppData.ARRAY_SIZE_X && xValue + i >= 0
        {
            xValue += i
            print("test1")
            xCheck = true
        }
        if yValue + j <= AppData.ARRAY_SIZE_Y && yValue + j >= 0
        {  yValue += j
            print("test2")
            yCheck = true
        }
        var tempImage = AppData.secondFloor2DNorth[xValue][yValue]
        if xCheck && yCheck
        {
            if tempImage.whiteSpaceNorth
            {
                xValue-=i
                yValue-=j
                tempImage = AppData.secondFloor2DNorth[xValue][yValue]
            }
        }
        print("Cardinal Direction: \(cardinalDirection)")
        if cardinalDirection == 0
        {
            imageViewOutlet.image = AppData.secondFloor2DNorth[xValue][yValue].imageNorth
            print("displayNorth")
        }
        else if cardinalDirection == 1
        {
            imageViewOutlet.image = AppData.secondFloor2DNorth[xValue][yValue].imageEast
            print("displayEast")
        }
        else if cardinalDirection == 2
        {
            imageViewOutlet.image = AppData.secondFloor2DNorth[xValue][yValue].imageSouth
            print("displaySouth")
        }
        else if cardinalDirection == 3
        {
            imageViewOutlet.image = AppData.secondFloor2DNorth[xValue][yValue].imageWest
            print("displayWest")
        }
        print("isWhiteSpace \(AppData.secondFloor2DNorth[xValue][yValue].whiteSpaceNorth)")
        print("Reported X and Y:  \(xValue) , \(yValue)")
        //print("isWhiteSpace+1 \(AppData.secondFloor2DNorth[xValue+1][yValue].whiteSpaceNorth)")
        print("Image Value:  \(tempImage.image)")
        
        
        
        
        
   
        
        
//            imageViewOutlet.image = UIImage(named: secondFloor[xValue + i].image)
//        xValue = secondFloor[xValue + i].xCord
        
    }
//    func printData()
//    {
//        var output = "Cords: \(AppData.secondFloor2DNorth[xValue][yValue].image) \ \(AppData.secondFloor2DNorth[xValue][yValue].whiteSpace)"
//    }
    

    func update2D()
    {
        print("updating 2D")
        var i = 0
        var j = 0
        while (i <= AppData.ARRAY_SIZE_X)
        {
            print("I: \(i)")
            j = 0
            while (j <= AppData.ARRAY_SIZE_Y)
            {
                print("J: \(j)")
                if AppData.secondFloor2DNorth[i][j].imageNorth != UIImage(named: "def") && AppData.secondFloor2DNorth[i][j].whiteSpaceNorth == true
                {
                    AppData.secondFloor2DNorth[i][j].whiteSpaceNorth = false
                    print("\(i),\(j) whiteSpaceUpdateNorth")
                }
                if AppData.secondFloor2DNorth[i][j].imageEast != UIImage(named: "def") && AppData.secondFloor2DNorth[i][j].whiteSpaceEast == true
                {
                    AppData.secondFloor2DNorth[i][j].whiteSpaceEast = false
                    print("\(i),\(j) whiteSpaceUpdateEast")
                }
                if AppData.secondFloor2DNorth[i][j].imageSouth != UIImage(named: "def") && AppData.secondFloor2DNorth[i][j].whiteSpaceSouth == true
                {
                    AppData.secondFloor2DNorth[i][j].whiteSpaceSouth = false
                    print("\(i),\(j) whiteSpaceUpdateSouth")
                }
                if AppData.secondFloor2DNorth[i][j].imageWest != UIImage(named: "def") && AppData.secondFloor2DNorth[i][j].whiteSpaceWest == true
                {
                    AppData.secondFloor2DNorth[i][j].whiteSpaceWest = false
                    print("\(i),\(j) whiteSpaceUpdateWest")
                }
                j += 1
            }
            i += 1
        }
        
    }
    
    @IBAction func saveToCore(_ sender: Any) {  
        var i = 0
        var j = 0
        while (i < AppData.ARRAY_SIZE_X)
        {
            print("Loading I: \(i)")
            j = 0
            while (j < AppData.ARRAY_SIZE_Y)
            {
                print("Loading J: \(j)")

                AppData.twoDDataArray[i][j] = DataPicture( i: "0", x:0, y:0 ,wSN: AppData.secondFloor2DNorth[i][j].whiteSpaceNorth, wSE: AppData.secondFloor2DNorth[i][j].whiteSpaceEast, wSS: AppData.secondFloor2DNorth[i][j].whiteSpaceSouth, wSW: AppData.secondFloor2DNorth[i][j].whiteSpaceWest, iN: AppData.secondFloor2DNorth[i][j].imageNorth.pngData()! as Data, iE: AppData.secondFloor2DNorth[i][j].imageEast.pngData()! as Data, iW: AppData.secondFloor2DNorth[i][j].imageWest.pngData()! as Data, iS: AppData.secondFloor2DNorth[i][j].imageSouth.pngData()! as Data)


            }
                j += 1
        }
            i += 1

        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.twoDDataArray) {
                           UserDefaults.standard.set(encoded, forKey: "AppData.twoDDataArray")
                       }

        }


    @IBAction func loadFromCore(_ sender: Any) {



        if let items = UserDefaults.standard.data(forKey: "twoDDataArray") {
                        let decoder = JSONDecoder()
                        if let decoded = try? decoder.decode([[DataPicture]].self, from: items) {
                            AppData.twoDDataArray = decoded
                        }
                }
        var i = 0
        var j = 0
        while (i < AppData.ARRAY_SIZE_X)
        {
            j = 0
            while (j < AppData.ARRAY_SIZE_Y)
            {
                AppData.secondFloor2DNorth[i][j].imageNorth = UIImage(data: AppData.twoDDataArray[i][j].imageNorth)!
                AppData.secondFloor2DNorth[i][j].imageEast = UIImage(data: AppData.twoDDataArray[i][j].imageEast)!
                AppData.secondFloor2DNorth[i][j].imageSouth = UIImage(data: AppData.twoDDataArray[i][j].imageSouth)!
                AppData.secondFloor2DNorth[i][j].imageWest = UIImage(data: AppData.twoDDataArray[i][j].imageWest)!
                j += 1
            }
            i += 1
        }

    }

        
        
        
    
    
    func create2D()
    {
        var i = 0
        var j = 0
        while (i <= AppData.ARRAY_SIZE_X)
        {
            j = 0
            var littleArray = [Picture]()
            while (j <= AppData.ARRAY_SIZE_Y)
            {
                print("Create New Object")
                var inString = "\(i),\(j)"
                var imN = UIImage(named: "N\(inString)")
                var imW = UIImage(named: "W\(inString)")
                var imE = UIImage(named: "E\(inString)")
                var imS = UIImage(named: "S\(inString)")
                print("inString: \(inString)")
                var isEmptyNorth = false
                var isEmptyEast = false
                var isEmptySouth = false
                var isEmptyWest = false
                if imN == nil
                {
                    imN = UIImage(named: "def")
                    print("North Default")
                    isEmptyNorth = true
                }
                if imW == nil
                {
                    imW = UIImage(named: "def")
                    print("West Default")
                    isEmptyWest = true
                }
                if imE == nil
                {
                    imE = UIImage(named: "def")
                    print("East Default")
                    isEmptyEast = true
                }
                if imS == nil
                {
                    imS = UIImage(named: "def")
                    print("South Default")
                    isEmptySouth = true
                }
                
                //print(isEmpty)
                littleArray.append(Picture(i: inString, x: i, y: j,wSN: isEmptyNorth, wSE: isEmptyEast, wSS: isEmptySouth, wSW: isEmptySouth, iN: imN! ,iE: imE!, iW: imW!, iS: imS! ))
    
                print("LITTLE: \(littleArray[j].image)")
                print("Nums: \(i),\(j)")
                //print(secondFloor2D[i][j].image)
                j += 1
            }
            AppData.secondFloor2DNorth[i].append(contentsOf: littleArray)
            i += 1
        }
      

        

        
    }
    
}


