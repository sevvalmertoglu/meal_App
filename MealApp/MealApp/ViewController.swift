//
//  ViewController.swift
//  MealApp
//
//  Created by Şevval Mertoğlu on 11.09.2023.
//

import UIKit
import CoreApi

class ViewController: UIViewController {
    let networkManager: NetworkManager<HomeEndpointItem> = NetworkManager()

    @IBOutlet private weak var widgetsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWidgets()
    }
    
    
    private func fetchWidgets() {
        networkManager.request(endpoint: .homepage(query: "page=1"), type: HomeResponse.self) { result in
            switch result {
            case .success(let response):
                print(response)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}

