import UIKit

class ViewController: UIViewController {
    
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    let effectView = UIVisualEffectView(effect: nil)
    
    let imageView: UIImageView = {
        let image = UIImage(named: "img5")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBlurEffect()
        animator.addAnimations {
            self.effectView.effect = UIBlurEffect(style: .regular)
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(hangleGesture)))
    }
    
    fileprivate func setupView() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor), imageView.topAnchor.constraint(equalTo: view.topAnchor), imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor), imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    fileprivate func setupBlurEffect() {
        view.addSubview(effectView)
        effectView.frame = view.frame
    }
    
    @objc fileprivate func hangleGesture(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let translatedCenterY = view.center.y + translation.y
        let progress = translatedCenterY / self.view.bounds.size.height
        animator.fractionComplete = progress
        print(progress)
    }
}
