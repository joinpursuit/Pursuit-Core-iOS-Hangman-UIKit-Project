//
//  CategoriesViewController.swift
//  Hangman
//
//  Created by Cameron Rivera on 11/13/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let categoryArray: [Category] = Data.singlePlayerWords.sorted{ $0.type < $1.type}
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameViewControllerReference = segue.destination as? GameViewController, let indexPath = tableView.indexPathForSelectedRow else{
            return
        }
        
        gameViewControllerReference.categoryClassInstance = categoryArray[indexPath.row]
        gameViewControllerReference.setOneOrTwoPlayers(false)
    }

}

extension CategoriesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        xCell.textLabel?.text = categoryArray[indexPath.row].type
        return xCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Categories"
    }
}
