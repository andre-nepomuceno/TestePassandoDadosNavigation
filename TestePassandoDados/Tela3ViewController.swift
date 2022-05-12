//
//  Tela3ViewController.swift
//  TestePassandoDados
//
//  Created by André N. dos Santos on 12/05/22.
//

import UIKit

class Tela3ViewController: UIViewController {

    var pessoa: Pessoa?
    
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var alturaLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pessoa = pessoa {
            nomeLabel.text = pessoa.nome
            idadeLabel.text = "\(pessoa.idade) anos"
            alturaLabel.text = "\(pessoa.altura) metros"
            generoLabel.text = pessoa.genero.rawValue == 0 ? "Feminino" : "Masculino"
        }
    }
}
