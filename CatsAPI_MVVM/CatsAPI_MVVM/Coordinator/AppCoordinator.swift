//
//  AppCoordinator.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 23.12.2021.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    private lazy var tabBarController = UITabBarController()
    private lazy var navigationControllers = AppCoordinator.makeNavigationControllers()
    private let appDependency: AppDependency
    
    init(window: UIWindow, appDependency: AppDependency) {
        self.window = window
        self.appDependency = appDependency
        navigationControllers = AppCoordinator.makeNavigationControllers()
    }
    
    func start() {
        if #available(iOS 13.0, *) {
            window.overrideUserInterfaceStyle = .light
        }
        
        setupCats()
        
        let navigationControllers = NavigationControllersType.allCases.compactMap {
            self.navigationControllers[$0]
        }
        window.rootViewController = navigationControllers[0]
        window.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    static func makeNavigationControllers() -> [NavigationControllersType: UINavigationController] {
        var result: [NavigationControllersType: UINavigationController] = [:]
        NavigationControllersType.allCases.forEach { navigationControllerKey in
            let navigationController = UINavigationController()
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.navigationBar.sizeToFit()
            result[navigationControllerKey] = navigationController
        }
        return result
    }
    
    func setupCats() {
        guard let navController = self.navigationControllers[.cats] else {
            fatalError("something wrong with appCoordinator")
        }
        let CatVC = CatViewController(viewModel: appDependency.catsViewModel)
        CatVC.navigationItem.title = Localize.cats
        navController.setViewControllers([CatVC], animated: false)
        setupAppearanceNavigationBar(with: navController)
    }
    
    func setupAppearanceTabBar(with controller: UITabBarController) {
        let tabBarAppearance = UITabBarAppearance()
        
        tabBarAppearance.backgroundColor = Colors.lightGray
        
        if #available(iOS 15.0, *) {
            controller.tabBar.scrollEdgeAppearance = tabBarAppearance
        }
        controller.tabBar.standardAppearance = tabBarAppearance
        controller.tabBar.unselectedItemTintColor = Colors.grayTabBar
        controller.selectedIndex = 0
        
        UITabBar.appearance().tintColor = Colors.purple
        
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.normal.titleTextAttributes = [.font: Font.sber(ofSize: Font.Size.ten, weight: .bold)]
        tabBarItemAppearance.selected.titleTextAttributes = [.font: Font.sber(ofSize: Font.Size.ten, weight: .bold)]
        
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: controller.tabBar.frame.width, y: 0))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = Colors.lightWhite.cgColor
        shapeLayer.lineWidth = 0.4

        controller.tabBar.layer.addSublayer(shapeLayer)
    }
    
    func setupAppearanceNavigationBar(with controller: UINavigationController) {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = Colors.lightGray
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black,
                                                       .font : Font.sber(ofSize: Font.Size.twenty, weight: .bold)]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black,
                                                            .font : Font.sber(ofSize: Font.Size.thirdyFour, weight: .bold),
                                                            .paragraphStyle: paragraphStyle,
                                                            .kern: 0.41]
        UINavigationBar.appearance().tintColor = Colors.purple
        controller.navigationBar.standardAppearance = navigationBarAppearance
        controller.navigationBar.compactAppearance = navigationBarAppearance
        controller.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        controller.navigationBar.setBackgroundImage(UIImage(), for: .default)
        controller.navigationBar.shadowImage = UIImage()
    }
}

fileprivate enum NavigationControllersType: Int, CaseIterable {
    case cats
    var title: String {
        switch self {
        case .cats:
            return Localize.cats
        }
    }
}
