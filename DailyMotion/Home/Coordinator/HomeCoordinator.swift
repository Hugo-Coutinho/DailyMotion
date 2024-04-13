//
//  HomeCoordinator.swift
//  DailyMotion
//
//  Created by Hugo Coutinho on 2024-04-12.
//

import UIKit
import AVFoundation
import AVKit
import Videos

protocol HomeCoordinatorInput: AnyObject {
    // MARK: - VARIABLES -
    var homeViewController: ViewController { get set }
    
    // MARK: - INPUT METHODS -
    func make() -> ViewController
    func goToVideo(link: URL)
}

class HomeCoordinator: HomeCoordinatorInput {
    var homeViewController: ViewController = ViewController()
    
    // MARK: - CONSTRUCTOR -
    init() {}
    
    @MainActor
    func make() -> ViewController {
        let viewModel = HomeViewModel()
        
        viewModel.coordinator = self
        homeViewController.viewModel = viewModel
        homeViewController.homeSections = [
            VideosCoordinator().make(output: homeViewController)
        ]
        
        return homeViewController
    }
    
    func goToVideo(link: URL) {
        if let videoURL = APIConstant.videoURL {
            let playerItem = AVPlayerItem(url: videoURL)
            let player = AVPlayer(playerItem: playerItem)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            
            homeViewController.present(playerViewController, animated: true) {
                player.play()
            }
        }
    }
}
