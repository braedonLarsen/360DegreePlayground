//
//  DataPicture.swift
//  360DegreePlayground
//
//  Created by BRAEDON LARSEN on 3/16/23.
//

import Foundation

//
//  Picture.swift
//  360DegreePlayground
//
//  Created by BRAEDON LARSEN on 2/10/23.
//

import Foundation
import UIKit
class DataPicture: Codable
{
    
   
    var whiteSpaceNorth: Bool
    var whiteSpaceEast: Bool
    var whiteSpaceSouth: Bool
    var whiteSpaceWest: Bool
    var imageNorth: NSData
    var imageEast: NSData
    var imageWest: NSData
    var imageSouth: NSData
    
  
    
    

    
    
    init(i: String, x:Int, y: Int,wSN: Bool, wSE: Bool, wSS: Bool, wSW: Bool, iN:NSData, iE:NSData, iW:NSData, iS:NSData)
    {
      
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
