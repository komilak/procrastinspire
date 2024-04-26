//
//  IntentViewController.swift
//  Procrastinspire
//
//  Created by Komila Khamidova on 4/25/24.
//

import UIKit

class IntentViewController: UIViewController {

    
    @IBOutlet weak var workButton: UIButton!
    @IBOutlet weak var relaxButton: UIButton!
    @IBOutlet weak var learnButton: UIButton!
    @IBOutlet weak var cookButton: UIButton!
    
    
    private var intentionOptions = [Intention]() // tracks all the possible forecasts
    private var selectedIntentionIndex = 0
    
    @IBAction func didTapWorkButton(_ sender: UIButton) {
    }
    
    
    @IBAction func didTapRelaxButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapLearnButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapCookButton(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
