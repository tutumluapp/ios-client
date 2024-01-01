//
//  UploadSlipView.swift
//  tutumlu
//
//  Created by ali-kerem on 31.12.2023.
//

import UIKit

class UploadSlipView: UIView {
    let headerStackView = UIStackView()
    let bottomBorder = UIView()
    let tableView = UITableView()
    let uploadButton = RoundedGreenButton()
    
    let items = UploadData.items

    var isScanned: [Bool] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isScanned = Array(repeating: false, count: items.count) // Initialize no item scanned

        setupView()
        setupHeaderStackView()
        setupHeaderBorder()
        setupTableView()
        setupUploadButton()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupHeaderStackView() {
        // Outer Vertical Stack View containing market, time and date info
        headerStackView.axis = .vertical
        headerStackView.distribution = .fill
        headerStackView.alignment = .fill
        headerStackView.spacing = 8

        // Horizontal Stack View for Market and Date
        let marketDateStackView = UIStackView()
        marketDateStackView.axis = .horizontal
        marketDateStackView.distribution = .fill
        marketDateStackView.alignment = .fill
        marketDateStackView.spacing = 8

        let marketLabel = UILabel()
        marketLabel.text = "Market: ŞOK"
        marketLabel.textAlignment = .left

        let dateLabel = UILabel()
        dateLabel.text = "Date: 17/11/2023"
        dateLabel.textAlignment = .right
        
        let marketLabelContainer = UIView()
        let dateLabelContainer = UIView()
        
        marketLabelContainer.addSubview(marketLabel)
        dateLabelContainer.addSubview(dateLabel)
        
        marketDateStackView.addArrangedSubview(marketLabelContainer)
        marketDateStackView.addArrangedSubview(dateLabelContainer)

        let timeLabel = UILabel()
        timeLabel.text = "Time: 11:58:17"
        timeLabel.textAlignment = .right
        
        headerStackView.addArrangedSubview(marketDateStackView)
        headerStackView.addArrangedSubview(timeLabel)

        addSubview(headerStackView)

        marketLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        marketDateStackView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            marketLabel.topAnchor.constraint(equalTo: marketLabelContainer.topAnchor),
            marketLabel.leadingAnchor.constraint(equalTo: marketLabelContainer.leadingAnchor),
            marketLabel.bottomAnchor.constraint(equalTo: marketLabelContainer.bottomAnchor),
            marketLabel.trailingAnchor.constraint(equalTo: marketLabelContainer.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: dateLabelContainer.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: dateLabelContainer.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: dateLabelContainer.bottomAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dateLabelContainer.trailingAnchor, constant: -16),
            
            marketDateStackView.topAnchor.constraint(equalTo: headerStackView.topAnchor, constant: 16),
            marketDateStackView.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor, constant: 16),
            marketDateStackView.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor, constant: -16),
                        
            timeLabel.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor, constant: -16),
            
        ])
    }
    
    private func setupHeaderBorder () {
        bottomBorder.backgroundColor = UIColor(hexString: "##e8e8e8")
        addSubview(bottomBorder)
    }

    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UploadSlipTableViewCell.self, forCellReuseIdentifier: "UploadSlipTableViewCell")
        
        addSubview(tableView)
    }
    
    private func setupUploadButton() {
        uploadButton.layer.cornerRadius = 0
        uploadButton.setTitle("Upload", for: .normal)
        addSubview(uploadButton)
    }
    
    private func setupConstraints() {
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomBorder.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomBorder.heightAnchor.constraint(equalToConstant: 1), // Thickness
            
            tableView.topAnchor.constraint(equalTo: bottomBorder.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: uploadButton.topAnchor),
            
            uploadButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            uploadButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            uploadButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            uploadButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension UploadSlipView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UploadSlipTableViewCell", for: indexPath) as? UploadSlipTableViewCell else {
            fatalError("Could not dequeue UploadItemTableViewCell")
        }
        
        let item = items[indexPath.row]
        cell.configure(with: item)
        cell.isScanned = isScanned[indexPath.row]
        cell.selectionStyle = .none
        
        cell.scanAction = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.isScanned[indexPath.row] = true
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
    }
}


extension UploadSlipView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension UploadSlipView {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? UploadSlipTableViewCell else { return }
        cell.layoutIfNeeded()
    }
}
