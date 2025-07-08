
import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String?
    var textResult: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result ?? "0.0"
        settingsLabel.text = textResult ?? "Split settings unavailable"
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
