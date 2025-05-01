//
//  ViewController.swift
//  Mallina_Exam03
//
//  Created by Venkata kishore korrapati on 4/22/25.
//

import UIKit

class MallinaHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var MallinaTVOL: UITableView!
    var sortedGames: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Games"
        MallinaTVOL.delegate = self
        MallinaTVOL.dataSource = self
        // Sort games alphabetically by name (handling nil values)
        sortedGames = games.sorted { ($0.name ?? "") < ($1.name ?? "") }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedGames.count
    }
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //            return games.count
    //        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mallinaCell", for: indexPath)
        cell.textLabel?.text = sortedGames[indexPath.row].name
        return cell
    }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        performSegue(withIdentifier: "cheekatiDescriptionSegue", sender: indexPath.row)
    //    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "mallinaDescriptionSegue" {
            let destination = segue.destination as! MallinaGameController
            if let index = MallinaTVOL.indexPathForSelectedRow?.row {
                destination.game = sortedGames[index]
            }
        }
        
        
    }
    
}
