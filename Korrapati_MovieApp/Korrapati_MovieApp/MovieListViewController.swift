//
//  MovieListViewController.swift
//  Korrapati_MovieApp
//
//  Created by Venkata kishore korrapati on 4/23/25.
//

import UIKit

class MovieListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var movieListTableView: UITableView!
    var genreTitle: String = ""
        var movies: [MovieList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = genreTitle
                movieListTableView.delegate = self
                movieListTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movies.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
            cell.textLabel?.text = movies[indexPath.row].movieName
            return cell
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "movieInfoSegue",
               let destination = segue.destination as? MovieInfoViewController,
               let indexPath = movieListTableView.indexPathForSelectedRow{
                destination.selectedMovie = movies[indexPath.row]
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
