import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let button = UIButton(configuration: .filled(), primaryAction: UIAction(title: "Show Tab Bar Controller") { [weak self] _ in
            self?.showTabBarController()
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func showTabBarController() {
        let tabBarController = UITabBarController()
        tabBarController.tabs = ["First", "Second", "Third"].map { title in
            UITab(title: title, image: UIImage(systemName: "circle"), identifier: title) { _ in
                let viewController = UIViewController()
                viewController.view.backgroundColor = .systemBackground
                return viewController
            }
        }

        addChild(tabBarController)
        
        // Uncomment to show the tab bar on the unfolded iPhone Duo.
        // tabBarController.view.frame = view.bounds
        
        view.addSubview(tabBarController.view)
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBarController.view.topAnchor.constraint(equalTo: view.topAnchor),
            tabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        tabBarController.didMove(toParent: self)
    }

}
