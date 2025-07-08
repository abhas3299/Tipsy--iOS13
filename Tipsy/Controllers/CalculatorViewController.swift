
import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPecButton: UIButton!
    @IBOutlet weak var tenPecButton: UIButton!
    @IBOutlet weak var twentyPecButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Double = 0.1
    var finalResult: String = ""
    var finalSummary: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPecButton.isSelected = false
        tenPecButton.isSelected = false
        twentyPecButton.isSelected =  false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle ?? "0.0"
        let titleWithoutPercent = buttonTitle.dropLast()
        
        tip = (Double(titleWithoutPercent) ?? 0.0)/100.0
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let split = Int(splitNumberLabel.text!) ?? 2
        let billText = billTextField.text ?? "0.0"
        
        let bill = Double(billText) ?? 0.0
        let splitBill = (bill * (tip + 1))/Double(split)
        
        finalResult = String(format: "%.1f", splitBill)
        finalSummary = "Split between \(split) people, with \(Int(tip*100))% tip"
        performSegue(withIdentifier: "goToResults", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.textResult = finalSummary
        }
    }
}


