//
//  HomeViewModel.swift
//  DailyMotion
//
//  Created by Hugo Coutinho on 2024-04-12.
//

import Foundation

// MARK: - VIEWMODEL INPUT PROTOCOL -
protocol HomeViewModelInput: AnyObject {

    // MARK: - VARIABLES -
    var coordinator: HomeCoordinatorInput? { get set }

    // MARK: - INPUT METHODS -
    func goToVideo(link: URL)
}

class HomeViewModel: HomeViewModelInput {
    
    // MARK: - VARIABLES -
    var coordinator: HomeCoordinatorInput?

    // MARK: - CONSTRUCTORS -
    init() {}
    
    func goToVideo(link: URL) {
        coordinator?.goToVideo(link: link)
    }
}



