//
//  UnderLineTextField.swift
//  MID
//
//  Created by 천성우 on 5/14/24.
//

import UIKit

import Then
import SnapKit

class UnderLineTextField: UITextField {
    
    lazy var placeholderColor: UIColor = .white000
    lazy var placeholderString: String = ""
    
    private lazy var underLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .white000
        return lineView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(underLineView)
        underLineView.snp.makeConstraints {
            $0.top.equalTo(self.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        self.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        self.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)

    }
    
    func setPlaceholder(placeeholder: String, color: UIColor) {
        placeholderString = placeeholder
        placeholderColor = color
        
        setPlaceholder()
        underLineView.backgroundColor = placeholderColor
    }
    
    func setPlaceholder() {
        self.attributedPlaceholder = NSAttributedString(
            string: placeholderString,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
    }
    
    func setError() {
        self.attributedPlaceholder = NSAttributedString(
            string: placeholderString,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red300]
        )
        underLineView.backgroundColor = .red300
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UnderLineTextField {
    @objc
    func editingDidBegin() {
        setPlaceholder()
        underLineView.backgroundColor = .white000
    }
    
    @objc
    func editingDidEnd() {
        underLineView.backgroundColor = placeholderColor
    }
}
