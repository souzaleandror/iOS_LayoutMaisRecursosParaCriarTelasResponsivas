//
//  OfertaTableViewCell.swift
//  AluraViagens
//
//  Created by Leandro Rodrigues on 30.07.23.
//

import UIKit

class OfertaTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var viagemImages: [UIImageView]!
    @IBOutlet var tituloViagemLabels: [UILabel]!
    @IBOutlet var subtituloViagemLabels: [UILabel]!
    @IBOutlet var precoSemDescontoLabels: [UILabel]!
    @IBOutlet var precoLabels: [UILabel]!
    @IBOutlet var fundoViews: [UIView]!
    
    func configuraCelula(_ viagens: [Viagem]?) {
        guard let listaDeVagem = viagens else { return }

        for i in 0..<listaDeVagem.count {
            setOutlets(i, viagem: listaDeVagem[i])
        }
        
        DispatchQueue.main.async {
            self.fundoViews.forEach { viewAtual in viewAtual.addSombra() }
        }
    }
    
    func setOutlets(_ index: Int, viagem: Viagem) {
        let imageOutlet = viagemImages[index]
        imageOutlet.image = UIImage(named: viagem.asset)
        
        let tituloOutlet = tituloViagemLabels[index]
        tituloOutlet.text = viagem.titulo
        
        let subtituloOutlet = subtituloViagemLabels[index]
        subtituloOutlet.text = viagem.subtitulo
        
        let precoOutlet = precoLabels[index]
        precoOutlet.text = "R$ \(viagem.preco)"
        
        let precoSemDescontoOutlet = precoSemDescontoLabels[index]
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem.precoSemDesconto)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoOutlet.attributedText = atributoString
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
