//
//  SectionView.swift
//  StripeiOS
//
//  Created by Yuki Tokuhiro on 6/4/21.
//  Copyright © 2021 Stripe, Inc. All rights reserved.
//

import Foundation
import UIKit

typealias SectionViewModel = SectionElement.ViewModel

class SectionView: UIView {
    
    // MARK: - Views
    
    lazy var errorLabel: UILabel = {
        let error = PaymentSheetUI.makeErrorLabel()
        return error
    }()
    let containerView: ContainerView

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        let font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.font = fontMetrics.scaledFont(for: font)
        label.textColor = CompatibleColor.secondaryLabel
        label.accessibilityTraits = [.header]
        return label
    }()
    
    // MARK: - Initializers
    
    init(viewModel: SectionViewModel) {
        self.containerView = ContainerView(views: viewModel.elements)
        super.init(frame: .zero)

        let stack = UIStackView(arrangedSubviews: [titleLabel, containerView, errorLabel])
        stack.axis = .vertical
        stack.spacing = 4
        addAndPinSubview(stack)

        update(with: viewModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods

    func update(with viewModel: SectionViewModel) {
        titleLabel.text = viewModel.title
        titleLabel.isHidden = viewModel.title == nil
        if let error = viewModel.error, !error.isEmpty {
            errorLabel.text = viewModel.error
            errorLabel.isHidden = false
            containerView.style = .error
        } else {
            errorLabel.text = nil
            errorLabel.isHidden = true
            containerView.style = .default
        }
        
        isHidden = viewModel.elements.filter({ !$0.isHidden }).isEmpty
    }
}


