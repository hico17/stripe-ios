//
//  DropdownTextField.swift
//  StripeiOS
//
//  Created by Yuki Tokuhiro on 6/17/21.
//  Copyright © 2021 Stripe, Inc. All rights reserved.
//

import UIKit

// MARK: - DropdownTextField

/**
 A subclass of `UITextField` that disables manual text entry.
 */
class DropdownTextField: UITextField {
    
    // MARK: Overrides
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        // Disallow selection
        return .zero
    }
    
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        // Disallow selection
        return []
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}

// MARK: UITextFieldDelegate

extension DropdownTextField: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        return false
    }
}
