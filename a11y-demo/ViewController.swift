//
//  ViewController.swift
//  a11y-demo
//
//  Created by Kevin Zolkiewicz on 2018-11-07.
//  Copyright © 2018 Kevin Zolkiewicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!

  var treeFamilies: [TreeFamily] = []
  var detailViewController: DetailViewController? = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableView.automaticDimension

    treeFamilies = [
      TreeFamily.init(family: "Maple", trees: [
        Tree.init(commonName: "Silver Maple", scientificName: "Acer saccharum", photo: UIImage.init(named: "silver-maple")!, description: "The silver maple tree is a relatively fast-growing deciduous tree, commonly reaching a height of 15–25 m (49–82 ft), exceptionally 35 m (115 ft). Its spread will generally be 11–15 m (36–49 ft) wide. A 10-year-old sapling will stand about 8 m (26 ft) tall. It is often found along waterways and in wetlands, leading to the colloquial name \"water maple\". It is a highly adaptable tree, although it has higher sunlight requirements than other maple trees.", photoDescription: "Photo of a silver maple leaf, showing a simple palmately deeply lobed leaf with 5 to 11 lobes and irregular teeth."),
        Tree.init(commonName: "Red Maple", scientificName: "Acer rubrum", photo: UIImage.init(named: "red-maple")!, description: "Insert longer description here.", photoDescription: "Photo description here"),
        Tree.init(commonName: "Norway Maple", scientificName: "Acer platanoides", photo: UIImage.init(named: "norway-maple")!, description: "Insert longer description here.", photoDescription: "Photo description here"),
        Tree.init(commonName: "Freeman Maple", scientificName: "Acer x freemanii", photo: UIImage.init(named: "freeman-maple")!, description: "Insert longer description here.", photoDescription: "Photo description here")
        ]),
      TreeFamily.init(family: "Oak", trees: [
        Tree.init(commonName: "White Oak", scientificName: "Quercus alba", photo: UIImage.init(named: "white-oak")!, description: "Insert longer description here.", photoDescription: "Photo description here"),
        Tree.init(commonName: "Bur Oak", scientificName: "Quercus macrocarpa", photo: UIImage.init(named: "bur-oak")!, description: "Insert longer description here.", photoDescription: "Photo description here"),
        Tree.init(commonName: "English Oak", scientificName: "Quercus robur", photo: UIImage.init(named: "bur-oak")!, description: "Insert longer description here.", photoDescription: "Photo description here"),
        Tree.init(commonName: "Chinkapin Oak", scientificName: "Quercus muehlenbergii", photo: UIImage.init(named: "chinkapin-oak")!, description: "Insert longer description here.", photoDescription: "Photo description here"),
        ]),
    ]
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let tree = treeFamilies[indexPath.section].trees[indexPath.row]
        let controller = segue.destination as! DetailViewController
        controller.tree = tree
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }

  
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return treeFamilies.count
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return treeFamilies[section].family
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return treeFamilies[section].trees.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let tree = treeFamilies[indexPath.section].trees[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "treeCell", for: indexPath) as! TableViewCell
    cell.title.text = tree.commonName
    cell.subtitle.text = tree.scientificName
    cell.photo.image = tree.photo
    return cell
  }
}
