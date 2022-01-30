//
//  ContributorListViewModel.swift
//  vlcContributors
//
//  Created by andrey rulev on 30.01.2022.
//

import ReactiveCocoa
import ReactiveSwift

class ContributorListViewModel {
    
    // MARK: - Public properties
    
    let reload: Signal<(), Never>
    let showError: Signal<String, Never>
    var loading: Property<Bool> { return Property(_loading) }
    
    // MARK: - Private properties
    
    private let reloadObserver: Signal<(), Never>.Observer
    private let showErrorObserver: Signal<String, Never>.Observer
    private let _loading: MutableProperty<Bool> = MutableProperty(false)
    
    private var contributors = [Contributor]()
    
    // MARK: - Lifecycle
    
    init() {
        (reload, reloadObserver) = Signal.pipe()
        (showError, showErrorObserver) = Signal.pipe()
    }
}


// MARK: - DataSource

extension ContributorListViewModel {
    var numberOfRows: Int {
        return contributors.count
    }
    
    func contributor(at index: Int) -> Contributor? {
        guard 0..<contributors.count ~= index else {
            return nil
        }
        
        return contributors[index]
    }
}

// MARK: - API

extension ContributorListViewModel {
    func loadContributers() {
        _loading.value = true
        
        ContributorManager.contributors { [weak self] contributorsArr, errorMesage in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf._loading.value = false

            if let errorActual = errorMesage {
                strongSelf.showErrorObserver.send(value: errorActual)
            } else if let contributorsActual = contributorsArr {
                strongSelf.contributors = contributorsActual
                strongSelf.reloadObserver.send(value: ())
            }
        }
    }
}
