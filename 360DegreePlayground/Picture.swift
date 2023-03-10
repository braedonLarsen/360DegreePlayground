//
//  Picture.swift
//  360DegreePlayground
//
//  Created by BRAEDON LARSEN on 2/10/23.
//

import Foundation
import UIKit
class Picture
{
    
    var image: String
    var xCord: Int
    var yCord: Int
    var whiteSpaceNorth: Bool
    var whiteSpaceEast: Bool
    var whiteSpaceSouth: Bool
    var whiteSpaceWest: Bool
    var imageNorth: UIImage
    var imageEast: UIImage
    var imageWest: UIImage
    var imageSouth: UIImage
    
  
    
    

    
    
    init(i: String, x:Int, y: Int,wSN: Bool, wSE: Bool, wSS: Bool, wSW: Bool, iN:UIImage, iE:UIImage, iW:UIImage, iS:UIImage)
    {
        image = i
        xCord = x
        yCord = y
        whiteSpaceNorth = wSN
        whiteSpaceEast = wSE
        whiteSpaceSouth = wSS
        whiteSpaceWest = wSW
        imageNorth = iN
        imageEast = iE
        imageWest = iW
        imageSouth = iS 
        
    }
    
}
