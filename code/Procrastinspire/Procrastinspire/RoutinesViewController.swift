//
//  RoutinesViewController.swift
//  Procrastinspire
//
//  Created by Komila Khamidova on 4/23/24.
//

import UIKit

class RoutinesViewController: UIViewController {

    
    @IBOutlet weak var popUpButton: UIButton!
    
    @IBOutlet weak var popUpButtonDay: UIButton!
    
    @IBOutlet weak var popUpButtonNight: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPopUp()
      }
    
    func setupPopUp() {
        let optionClosure = {(action: UIAction) in
          print(action.title)}
        popUpButton.menu = UIMenu(children: [
          UIAction(title: "Work", handler: optionClosure),
          UIAction(title: "Relax", state: .on, handler: optionClosure),
          UIAction(title: "Learn", handler: optionClosure),
          UIAction(title: "Cook", handler: optionClosure)
        ])
        popUpButton.showsMenuAsPrimaryAction = true
        popUpButton.changesSelectionAsPrimaryAction = true
        
        let optionClosureDay = {(action: UIAction) in
          print(action.title)}
        popUpButtonDay.menu = UIMenu(children: [
          UIAction(title: "Work", handler: optionClosureDay),
          UIAction(title: "Relax", state: .on, handler: optionClosureDay),
          UIAction(title: "Learn", handler: optionClosureDay),
          UIAction(title: "Cook", handler: optionClosureDay)
        ])
        popUpButtonDay.showsMenuAsPrimaryAction = true
        popUpButtonDay.changesSelectionAsPrimaryAction = true
        
        let optionClosureNight = {(action: UIAction) in
          print(action.title)}
        popUpButtonNight.menu = UIMenu(children: [
          UIAction(title: "Work", handler: optionClosureNight),
          UIAction(title: "Relax", state: .on, handler: optionClosureNight),
          UIAction(title: "Learn", handler: optionClosureNight),
          UIAction(title: "Cook", handler: optionClosureNight)
        ])
        popUpButtonNight.showsMenuAsPrimaryAction = true
        popUpButtonNight.changesSelectionAsPrimaryAction = true
        
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
