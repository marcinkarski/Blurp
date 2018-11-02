import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        let image = UIImage(named: "img5")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        NSLayoutConstraint.activate([imageView.leftAnchor.constraint(equalTo: view.leftAnchor), imageView.topAnchor.constraint(equalTo: view.topAnchor), imageView.rightAnchor.constraint(equalTo: view.rightAnchor), imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
