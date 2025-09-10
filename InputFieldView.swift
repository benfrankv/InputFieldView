//
//  InputFieldView.swift
//  Componente TextField
//
//  Created by Ben Frank V. on 09/09/25.
//

import UIKit

class InputFieldView: UIView {
    
    // MARK: - Subviews
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .purple
        label.text = "Título"
        return label
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = .systemFont(ofSize: 18)
        tf.placeholder = "Placeholder"
        return tf
    }()
    
    let helperLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .label
        label.text = "Máx. 20 caracteres"
        return label
    }()
    
    let bottomline: UIView = {
        let line = UIView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 1)))
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        let stack = UIStackView(arrangedSubviews: [titleLabel, textField, helperLabel, bottomline])
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stack)
        
        NSLayoutConstraint.activate([
            bottomline.heightAnchor.constraint(equalToConstant: 1),
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Métodos Públicos
    func configure(title: String, placeholder: String, helper: String) {
        titleLabel.text = title
        textField.placeholder = placeholder
        helperLabel.text = helper
    }
    
    /// Cambia color del helperLabel a rojo o gris
    func setHelperError(_ isError: Bool, message: String? = nil) {
        helperLabel.textColor = isError ? .red : .gray
        if let msg = message {
            helperLabel.text = msg
        }
    }
    
    @objc func getText() -> String? {
        return textField.text
    }
}

