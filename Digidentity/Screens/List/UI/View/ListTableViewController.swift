//
//  ListTableViewController.swift
//  Digidentity
//
//  Created by Denis Skokov on 12/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    enum Constants {
        static let itemCellReusableId = "ImageListTableViewCell"
        static let estimatedRowHeight = CGFloat(64.0)
    }
    
    var intentObserver: ListIntentObserver!
    var itemsList: [ListDisplayItem] = []
    
    let bottomLoadIndicator = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        refreshControl = UIRefreshControl(frame: CGRect.zero)
        refreshControl!.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        
        intentObserver.ready()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.itemCellReusableId, for: indexPath) as! ImageListTableViewCell
        
        let item = itemsList[indexPath.row]
        cell.update(listItem: item)

        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == itemsList.count - 1 && tableView.contentOffset.y > 0 {
            intentObserver.passedLast()
        }
    }
}

extension ListTableViewController {
    
    @objc func refresh() {
        intentObserver.passedFirst()
    }
    
    @objc func add() {
        intentObserver.addNewImage()
    }
}

extension ListTableViewController: ListRepresentation {
    
    func update(items:[ListDisplayItem]) {
        itemsList = items
        tableView.reloadData()

    }
    
    func append(items:[ListDisplayItem]) {
        tableView.performBatchUpdates({
            let itemsCount = itemsList.count
            let cellsIndexPathes = items.indices.map { index in
                return IndexPath(row: itemsCount + index, section: 0)
            }
            
            itemsList.append(contentsOf: items)
            tableView.insertRows(at: cellsIndexPathes, with: .none)
        })
    }
    
    func processing(at: ProcessingIndicatorLocation, show: Bool) {
        
        switch at {
        case .top:
            if show {
                tableView.refreshControl?.beginRefreshing()
            } else {
                tableView.refreshControl?.endRefreshing()
            }
            
        case .bottom:
            if show {
                bottomLoadIndicator.startAnimating()
                tableView.tableFooterView = bottomLoadIndicator
            } else {
                bottomLoadIndicator.stopAnimating()
                tableView.tableFooterView = nil
            }
        }
    }
}

extension ListTableViewController: ErrorHandler {}
