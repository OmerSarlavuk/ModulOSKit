//
//  File.swift
//
//
//  Created by Ö.Ş on 23.07.2024.
//

import SnapKit
import UIKit

open class StatusNotification {
    
    lazy private var alertView: UIView = {
       let view = UIView()
        return view
    }()
    
    lazy private var imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy private var title: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var button: UIButton = {
       let button = UIButton()
        return button
    }()
    
    public struct AlertViewModel {
        let image: UIImage
        let imageContentMode: UIView.ContentMode
        let title: String
        let textColor: UIColor
        let font: UIFont
        let textAligment: NSTextAlignment
        let buttonTitle: String
        let buttonTitleColor: UIColor
        let buttonTitleFont: UIFont
        let buttonBackgroundColor: UIColor
        let buttonLayerCornerRadius: CGFloat
        let alertBackgroundColor: UIColor
        let alertCornerRadius: CGFloat
        let alertBorderWith: CGFloat
        let alertBorderColor: CGColor
        let buttonAction: (() -> Void)?
        
        public init(image: UIImage, imageContentMode: UIView.ContentMode, title: String, textColor: UIColor, font: UIFont, textAligment: NSTextAlignment, buttonTitle:String, buttonTitleColor: UIColor, buttonTitleFont: UIFont, buttonBackgroundColor: UIColor, buttonLayerCornerRadius: CGFloat, alertBackgroundColor: UIColor, alertCornerRadius: CGFloat,alertBorderWith: CGFloat, alertBorderColor: CGColor, buttonAction: (() -> Void)? = nil) {
            self.image = image
            self.imageContentMode = imageContentMode
            self.title = title
            self.textColor = textColor
            self.font = font
            self.textAligment = textAligment
            self.buttonTitle = buttonTitle
            self.buttonTitleColor = buttonTitleColor
            self.buttonTitleFont = buttonTitleFont
            self.buttonBackgroundColor = buttonBackgroundColor
            self.buttonLayerCornerRadius = buttonLayerCornerRadius
            self.alertBackgroundColor = alertBackgroundColor
            self.alertCornerRadius = alertCornerRadius
            self.alertBorderWith = alertBorderWith
            self.alertBorderColor = alertBorderColor
            self.buttonAction = buttonAction
        }
    }
    
    public static func showAlert(on parentView: UIView, width: CGFloat, height: CGFloat, viewModel: AlertViewModel) {
        
        let instance = StatusNotification()
        instance.setupAlertUI()
        instance.configure(viewModel: viewModel)
        
        parentView.addSubview(instance.alertView)
        instance.alertView.frame = CGRect(
                    x: (parentView.frame.width - width) / 2,
                    y: (parentView.frame.height - height) / 2,
                    width: width,
                    height: height
                )
    }
    
    private func setupAlertUI() {
        alertView.addSubview(imageView)
        alertView.addSubview(title)
        alertView.addSubview(button)
        
        
        title.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        imageView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalTo(title.snp.top).offset(-16)
        }
        button.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview().offset(-16)
        }
        
    }
    
    private func configure(viewModel: AlertViewModel) {
        imageView.image = viewModel.image
        imageView.contentMode = viewModel.imageContentMode
        title.text = viewModel.title
        title.textColor = viewModel.textColor
        title.font = viewModel.font
        title.textAlignment = viewModel.textAligment
        button.setTitle(viewModel.buttonTitle, for: .normal)
        button.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        button.titleLabel?.font = viewModel.buttonTitleFont
        if #available(iOS 14.0, *) {
                   button.addAction(UIAction(handler: { handler in //order usage [weak self] _ in but 'weak' not usage self?.alertView.removeFromSuperView()
                       viewModel.buttonAction?()
                       self.alertView.removeFromSuperview()
                   }), for: .touchUpInside)
               } else {
                   //else state now empty :))
               }
        button.backgroundColor = viewModel.buttonBackgroundColor
        button.layer.cornerRadius = viewModel.buttonLayerCornerRadius
        alertView.backgroundColor = viewModel.alertBackgroundColor
        alertView.layer.cornerRadius = viewModel.alertCornerRadius
        alertView.layer.borderWidth = viewModel.alertBorderWith
        alertView.layer.borderColor = viewModel.alertBorderColor
    }
    
    
}

