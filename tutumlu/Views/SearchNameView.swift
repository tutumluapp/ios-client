//
//  SearchNameView.swift
//  tutumlu
//
//  Created by ali-kerem on 29.12.2023.
//

import UIKit

class SearchNameView: UIView {
    
    let tableView = UITableView()
    let searchBar = UISearchBar()
    
    let items = SearchData.items

    var isExpanded: [Bool] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isExpanded = Array(repeating: false, count: items.count) // Initialize with all items collapsed

        setupView()
        setupSearchBar()
        setupTableView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupSearchBar() {
        addSubview(searchBar)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchItemTableViewCell.self, forCellReuseIdentifier: "SearchItemTableViewCell")
        
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


extension SearchNameView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchItemTableViewCell", for: indexPath) as? SearchItemTableViewCell else {
            fatalError("Could not dequeue SearchItemTableViewCell")
        }
        
        let item = items[indexPath.row]
        cell.configure(with: item)
        cell.isExpanded = isExpanded[indexPath.row]
        cell.selectionStyle = .none
        
        // Add a closure or delegate to handle expansion
        cell.toggleAction = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.isExpanded[indexPath.row] = !strongSelf.isExpanded[indexPath.row]
            
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        
        return cell
    }
}


extension SearchNameView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.row]
        let priceCount = item.priceInfo.count
        return CGFloat(isExpanded[indexPath.row] ? 100 + 20 * priceCount  : 100)
    }
}

extension SearchNameView {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? SearchItemTableViewCell else { return }
        cell.layoutIfNeeded()
    }
}
