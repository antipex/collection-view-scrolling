import UIKit
import PureLayout
import SDCAlertView

class ViewController: UIViewController {

    let preferredCellSize = CGSize(width: 120.0, height: 120.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)

        button.setTitle("Show Alert", for: .normal)
        button.addTarget(self, action: #selector(tappedButton(sender:)), for: .touchUpInside)

        view.addSubview(button)

        button.autoPinEdgesToSuperviewEdges()
    }

    func tappedButton(sender: AnyObject) {
        let alertController = AlertController(title: "Pick a color", message: nil, preferredStyle: .actionSheet)

        let actionOne = AlertAction(title: "Cancel", style: .normal)
        let actionTwo = AlertAction(title: "Something", style: .normal)

        alertController.add(actionOne)
        alertController.add(actionTwo)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = preferredCellSize
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1.0

        let colorController = ColorController(collectionViewLayout: layout)

        alertController.addChildViewController(colorController)
        alertController.contentView.addSubview(colorController.view)

        colorController.view.autoSetDimension(.height, toSize: preferredCellSize.height)
        colorController.view.autoPinEdgesToSuperviewEdges()

        colorController.didMove(toParentViewController: alertController)

        alertController.present(animated: true, completion: nil)
    }


}

