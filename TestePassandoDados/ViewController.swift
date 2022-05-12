//
//  ViewController.swift
//  TestePassandoDados
//
//  Created by André N. dos Santos on 12/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var generoPickerView: UIPickerView!
    @IBOutlet weak var idadeLabel: UITextField!
    @IBOutlet weak var alturaLabel: UITextField!
    @IBOutlet weak var nomeLabel: UITextField!
    
    var pessoa: Pessoa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generoPickerView.delegate = self
        generoPickerView.dataSource = self
        
        nomeLabel.text = "Teste Andre"
        idadeLabel.text = "40"
        alturaLabel.text = "1.80"
        generoPickerView.selectRow(1, inComponent: 0, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "irDiretoParaTela3Segue" {
            if let tela3 = segue.destination as? Tela3ViewController {
                if let sender = sender as? Pessoa {
                    tela3.pessoa = sender
                }
            }
        }
    }
    
    @IBAction func ultimaTelaButtonAction(_ sender: UIButton) {
        buscarValoresComponentes()
        if let pessoa = pessoa {
            performSegue(withIdentifier: "irDiretoParaTela3Segue", sender: pessoa)
        }
    }
    
    func buscarValoresComponentes() {
        let nome = nomeLabel.text ?? ""
        let idade = Int(idadeLabel.text ?? "") ?? 0
        let altura = Double(alturaLabel.text ?? "") ?? 0.0
        guard let genero = Genero.init(rawValue: (generoPickerView.selectedRow(inComponent: 0))) else { return }
        let pessoa = Pessoa(nome: nome, idade: idade, altura: altura, genero: genero)
        print("Pessoa: \nNome: \(pessoa.nome)\nIdade: \(pessoa.idade)\nAltura: \(pessoa.altura)\nGênero: \(pessoa.genero)")
        self.pessoa = pessoa
    }
    
}
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let genero = Genero(rawValue: row)
        switch genero {
        case .Feminino:
            return "Feminino"
        case .Masculino:
            return "Masculino"
        case .none:
            return nil
        }
    }
}
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    
}
