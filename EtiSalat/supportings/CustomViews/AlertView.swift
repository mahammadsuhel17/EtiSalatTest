//
//  AlertView.swift
//  Allot
//
//  Created by Mani Deepika J M on 3/27/23.
//

import Foundation
import Foundation
import UIKit
import SwiftMessages
import TinyConstraints

private struct AlertConstants {
    static let viewWidth: CGFloat = 280
    static let viewHeight: CGFloat = 194
    static let offset: CGFloat = 40
    static let messageHorizontalOffset: CGFloat = 24
    static let actionButtonSize = CGSize(width: 95, height: 34)
    static let spacing: CGFloat = 24
    static let cornerRadius: CGFloat = 9
    static let lineSpacing: CGFloat = 2
}

/// alert type
enum AlertType {
    case normal, error
}

enum AlertActionType {
    case `default`
    case destructive
    case cancel
    case restricted
}

enum AlertActions {
    case actionYes
    case actionNo
    case actionOk
    case actionCotinue

    var text : String {
        switch self {
        case .actionYes:
            return "ALERT_YES"
        case .actionNo:
            return "ALERT_NO"
        case .actionOk:
            return "OK"
        case .actionCotinue:
            return "PopUpButtonTitle_Continue"
        }
    }
}

/// alert action
struct AlertAction {
    /// Get or set the action title
    let title: String
    /// Get or set the action image
    let image: String?
    /// Get or set the action callback
    let action: () -> Void
    /// Get or set the action style as UIAlertAction.Style
    var style: AlertActionType = .default
}

private class AlertButton: UIButton {
    var callback: (() -> Void)?
}


/// Custom alert view

class AlertView: UIView {
    private var config = SwiftMessages.Config()
    private let titleView = UIView()
    private let titleLabel = UILabel()
    private let descView = UIView()
    private let descLabel = UILabel()
    private let contentView = BaseView()
    /// Get or set the selected action
    private var selectedAction: AlertButton?
    /// Initialise custom alert with title and actions
    /// - Parameters:
    ///   - message: Alert message as String
    ///   - actions: Alert actions as CustomAlertAction
    
    init(title: String,desc: String, actions: [AlertAction]) {
        super.init(frame: CGRect.zero)
        setView(title: title, desc: desc, actions: actions)
        
    }
    
    /// Initialiser (not supported)
    /// - Parameter aDecoder: NSCoder
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Show custom alert
    /// - Parameter type: Optional, type as CustomAlertType. Default normal
    func show(type: AlertType = AlertType.normal) {
        if type == .error {
            titleLabel.textColor = .lightGray
        }
        SwiftMessages.hideAll()
        SwiftMessages.show(config: config, view: self)
    }
    
    private func setView(title: String, desc: String, actions: [AlertAction]) {

        self.height(UIScreen.main.bounds.height)
        setContentView()

        setTitleLabel(title)
        setDescLabel(desc)

        setActions(actions)

        updateConfiguration()

    }
    
    private func setContentView() {
        contentView.layer.cornerRadius = AlertConstants.cornerRadius
        contentView.backgroundColor = .white
        addSubview(contentView)
        contentView.width(AlertConstants.viewWidth)
        contentView.centerInSuperview()
    }
    
    private func setTitleLabel(_ message: String) {
        titleLabel.textAlignment = .center
        titleLabel.textColor = APPThemeColor.title
        titleLabel.font = APPFont.alertTitle
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 0
        titleLabel.letterSpace = 0.2

        let formattedString = message.trimmingCharacters(in: .whitespacesAndNewlines)
        let attributedString = NSMutableAttributedString(string: formattedString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = AlertConstants.lineSpacing
        
        // *** Apply attribute to string ***

        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle,range: NSRange(location: 0, length: message.count))

        // *** Set Attributed String to your label ***
        titleLabel.attributedText = attributedString

        titleView.addSubview(titleLabel)
        titleLabel.edgesToSuperview()

        contentView.addSubview(titleView)
        titleView.leading(to: contentView, offset: AlertConstants.messageHorizontalOffset)
        titleView.trailing(to: contentView, offset: -AlertConstants.messageHorizontalOffset)
        titleView.topToSuperview(offset: AlertConstants.messageHorizontalOffset)

    }
    
    private func setDescLabel(_ desc: String) {
        descLabel.textAlignment = .center
        descLabel.textColor = APPThemeColor.title
        descLabel.font = APPFont.extraSmall
        descLabel.adjustsFontSizeToFitWidth = true
        descLabel.numberOfLines = 0
        
        let formattedString = desc.trimmingCharacters(in: .whitespacesAndNewlines)
        let attributedString = NSMutableAttributedString(string: formattedString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = AlertConstants.lineSpacing
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: desc.count))

        // *** Set Attributed String to your label ***
        descLabel.attributedText = attributedString
        descLabel.letterSpace = 0.2
        descView.addSubview(descLabel)
        descLabel.edgesToSuperview()
        
        contentView.addSubview(descView)
        descLabel.leading(to: contentView, offset: AlertConstants.messageHorizontalOffset)
        descLabel.trailing(to: contentView, offset: -AlertConstants.messageHorizontalOffset)
        descView.topToBottom(of: titleView, offset: 16)

        let offset = AlertConstants.messageHorizontalOffset
        + AlertConstants.actionButtonSize.height
        + AlertConstants.spacing

        descView.bottomToSuperview(offset: -offset)

    }
    
    private func setActions(_ actions: [AlertAction]) {
        let buttons = actions.map { (action) -> AlertButton in
            let actionButton = AlertButton(frame: CGRect(origin: .zero,size: AlertConstants.actionButtonSize))
            actionButton.clipsToBounds = true
            actionButton.callback = action.action
            actionButton.setTitle(action.title, for: .normal)
            actionButton.layer.cornerRadius = 17
            actionButton.titleLabel?.font = APPFont.alertButton

            switch action.style {
            case .cancel:
                actionButton.backgroundColor = APPThemeColor.alertButtonBG
                actionButton.setTitleColor(APPThemeColor.buttonBackground, for: .normal)
            case .default:
                actionButton.backgroundColor = .white
                actionButton.setTitleColor(APPThemeColor.title, for: .normal)
            case .destructive:
                actionButton.backgroundColor = .lightGray
                actionButton.setTitleColor(.red, for: .normal)
            case .restricted:
                actionButton.backgroundColor = .lightGray
                actionButton.setTitleColor(.lightGray, for: .normal)
            }

            actionButton.addTarget(self, action: #selector(didPressActionButton(_:)), for: .touchUpInside)
            actionButton.size(AlertConstants.actionButtonSize)
            return actionButton
        }

        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.distribution = .fillProportionally
        stackView.alignment = .trailing
        stackView.spacing = 10
        contentView.addSubview(stackView)
        stackView.height(AlertConstants.actionButtonSize.height)
        //stackView.leftToSuperview(offset:  AlertConstants.messageHorizontalOffset)
        stackView.trailing(to: contentView, offset: -AlertConstants.messageHorizontalOffset)
        stackView.bottomToSuperview(offset: -AlertConstants.messageHorizontalOffset)
    }
    
    @objc private func didPressActionButton(_ sender: AlertButton) {
        SwiftMessages.hide()
        self.selectedAction = sender
    }
    
    /// Set custom alert configuration
    private func updateConfiguration() {
        // Slide up from the bottom.
        config.presentationStyle = .center
        // Display in a window at the specified window level.
        config.presentationContext = .window(windowLevel: .statusBar)
        // Disable the default auto-hiding behaviour.
        config.duration = .forever
        // Dim the background like a popover view. Hide when the background is tapped.
        let color = UIColor.black.withAlphaComponent(0.2)
        config.dimMode = .color(color: color,
                                interactive: false)
        // Disable the interactive pan-to-hide gesture.
        config.interactiveHide = false
        config.eventListeners.append { event in
            if case .didHide = event {
                self.selectedAction?.callback?()
                self.selectedAction = nil
            }
        }
    }
    
}
