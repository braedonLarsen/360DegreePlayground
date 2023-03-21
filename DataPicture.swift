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
    var imageNorth: Data
    var imageEast: Data
    var imageWest: Data
    var imageSouth: Data
    
    
    required init(from decoder: Decoder) throws
    {
        whiteSpaceNorth = false
        whiteSpaceEast = false
        whiteSpaceSouth = false
        whiteSpaceWest = false
        imageNorth = Data()
        imageEast = Data()
        imageWest = Data()
        imageSouth = Data()
    }

    
    
    init(i: String, x:Int, y: Int,wSN: Bool, wSE: Bool, wSS: Bool, wSW: Bool, iN:Data, iE:Data, iW:Data, iS:Data)
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
