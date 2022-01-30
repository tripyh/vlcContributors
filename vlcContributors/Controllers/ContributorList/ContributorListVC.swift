//
//  ContributorListVC.swift
//  vlcContributors
//
//  Created by andrey rulev on 30.01.2022.
//

import UIKit

class ContributorListVC: UIViewController {
    
    // MARK: - Private properties
    
    @IBOutlet private var tableView: UITableView!
    
    private let viewModel: ContributorListViewModel!
    
    // MARK: - Lifecycle
    
    init(viewModel: ContributorListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource

extension ContributorListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContributorListCell = tableView.dequeueReusableCell(for: indexPath)
        let contributor = viewModel.contributor(at: indexPath.row)
        cell.configure(contributor)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ContributorListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
