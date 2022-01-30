//
//  ContributorListVC.swift
//  vlcContributors
//
//  Created by andrey rulev on 30.01.2022.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import SVProgressHUD

class ContributorListVC: UIViewController {
    
    // MARK: - Private properties
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var loaderView: UIActivityIndicatorView!
    
    private let viewModel: ContributorListViewModel!
    private let (lifetime, token) = Lifetime.make()
    
    private var showError: BindingTarget<String> {
        return BindingTarget(lifetime: lifetime, action: { [weak self] message in
            self?.showError(message)
        })
    }
    
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
        configure()
        bindingViewModel()
        viewModel.loadContributers()
    }
}

// MARK: - Configure

private extension ContributorListVC {
    func configure() {
        navigationItem.title = "Contributors"
        tableView.register(ContributorListCell.self)
    }
}

// MARK: - BindingViewModel

private extension ContributorListVC {
    func bindingViewModel() {
        tableView.reactive.reloadData <~ viewModel.reload
        loaderView.reactive.isAnimating <~ viewModel.loading
        showError <~ viewModel.showError
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

// MARK: - Private

private extension ContributorListVC {
    func showError(_ error: String) {
        SVProgressHUD.show(withStatus: error)
        SVProgressHUD.dismiss(withDelay: 2)
    }
}
