//
//  ViewController.swift
//  BetterMVC
//
//  Created by Windy on 28/09/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var gameImplemention: GameProtocol = GameImplemention()
    var games: [GameModel] = []
    var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoading()
        getAllGames()
    }

    func getAllGames() {
        gameImplemention.getAllGames { [weak self] result in
            self?.loadingIndicator.stopAnimating()
            switch result {
            case .success(let games):
                self?.games = games
                self?.tableView.reloadData()
            case .failure(let err):
                self?.showAlert(message: err.errorDescription)
            }
        }
    }
    
    func setupLoading() {
        loadingIndicator = UIActivityIndicatorView(style: .medium)
        loadingIndicator.startAnimating()
        view.addSubview(loadingIndicator)
        loadingIndicator.center = view.center
    }
    
}

extension ViewController {
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let selectedGame = games[indexPath.row]
        showAlert(title: "You tap", message: "\(selectedGame.name)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = games[indexPath.row].name
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return games.count
    }
    
}

extension ViewController {
    
    func showAlert(title: String = "Perhatian", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
