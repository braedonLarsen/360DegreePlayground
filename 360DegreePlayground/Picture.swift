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
    var whiteSpace: Bool
    var imageImage: UIImage
    

    
    
    init(i: String, x:Int, y: Int, im:UIImage )
    {
        image = i
        xCord = x
        yCord = y
        whiteSpace = false
        imageImage = im 
    }
    
}
