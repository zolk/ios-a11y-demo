//
//  DetailViewController.swift
//  a11y-demo
//
//  Created by Kevin Zolkiewicz on 2018-11-07.
//  Copyright © 2018 Kevin Zolkiewicz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var headerStack: UIStackView!
  @IBOutlet weak var nameStack: UIStackView!
  @IBOutlet weak var descriptionStack: UIStackView!
  @IBOutlet weak var commonNameLabel: UILabel!
  @IBOutlet weak var scientficNameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var photo: UIImageView!

  var tree: Tree? {
    didSet {
      view.setNeedsLayout()
    }
  }

  override func viewWillLayoutSubviews() {
    if let tree = tree {
      title = tree.commonName
      commonNameLabel.text = tree.commonName
      scientficNameLabel.text = tree.scientificName
      descriptionLabel.text = tree.description
      photo.image = tree.photo
    }

    if traitCollection.preferredContentSizeCategory > .accessibilityLarge {
      headerStack.axis = .vertical
    } else {
      headerStack.axis = .horizontal
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

}
