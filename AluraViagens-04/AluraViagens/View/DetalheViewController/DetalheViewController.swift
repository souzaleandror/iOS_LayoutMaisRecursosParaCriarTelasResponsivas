//
//  DetalheViewController.swift
//  AluraViagens
//
//  Created by Leandro Rodrigues on 30.07.23.
//

import UIKit

class DetalheViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var botaoVoltar: UIButton!
    
    // MARK: - View life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botaoVoltar.titleLabel?.text = ""

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
