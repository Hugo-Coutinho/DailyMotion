//
//  ViewController.swift
//  DailyMotion
//
//  Created by Hugo Coutinho on 2024-04-12.
//

import UIKit
import HGUIComponent
import Videos

class ViewController: TableViewController {

    // MARK: - HOME PROPERTIES -
    var homeSections: [Section] = []
    var viewModel: HomeViewModel?
    
    // MARK: - LIFE CYCLE -
    override func viewWillLayoutSubviews() {
        title = Constant.Home.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeSections.forEach({ sections.append($0) })
        tableView.reloadData()
    }
}

// MARK: -SECTION OUTPUT -
extension ViewController: VideosSectionOutput {
    func openVideoWith(videoLink: URL) {
        viewModel?.goToVideo(link: videoLink)
    }
}


struct Constant {
    struct Home {
        static let title = "DailyMotion"
    }
}
