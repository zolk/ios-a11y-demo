//
//  Tree.swift
//  a11y-demo
//
//  Created by Kevin Zolkiewicz on 2018-11-07.
//  Copyright © 2018 Kevin Zolkiewicz. All rights reserved.
//

import Foundation
import UIKit

struct TreeFamily {
  var family: String
  var trees: [Tree]
}

struct Tree {
  var commonName: String
  var scientificName: String
  var photo:UIImage
  var description: String
}
