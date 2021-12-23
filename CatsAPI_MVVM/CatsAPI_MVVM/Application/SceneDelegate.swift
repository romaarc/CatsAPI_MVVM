//
//  SceneDelegate.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
   
    private lazy var appDependency: AppDependency = AppDependency.makeDefault()
    private var appCoordinator: AppCoordinator?
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        guard let window = window else { return }
        window.windowScene = windowScene
        
        appCoordinator = AppCoordinator(window: window, appDependency: appDependency)
        appCoordinator?.start()
    }
}

