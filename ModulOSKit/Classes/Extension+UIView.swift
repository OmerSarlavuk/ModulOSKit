//
//  File.swift
//
//
//  Created by Ö.Ş on 24.07.2024.
//

import UIKit
import SnapKit
import Kingfisher

private var indicator_key: UInt8 = 0


public extension UIView {
    
    typealias VoidCallback = () -> Void
    
    
    func onTap(handler: @escaping VoidCallback) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
        objc_setAssociatedObject(self, &AssociatedKeys.tapHandler, handler, .OBJC_ASSOCIATION_RETAIN)
    }
    
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        guard let handler = objc_getAssociatedObject(self, &AssociatedKeys.tapHandler) as? () -> Void else { return }
        handler()
    }
    
    
    
    //Image, title, identifier, handleTap
    func image_title_identifier_button_viewComponent(image: UIImage, title: String, identifier: String, backgorund: UIColor, handleTap: @escaping VoidCallback) {
        
        self.onTap(handler: handleTap)
        self.backgroundColor = backgorund
        self.layer.cornerRadius = 5
        
        let view = object_sender.send_imageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        let titleL = object_sender.send_label()
        titleL.textColor = .black
        titleL.font = .boldSystemFont(ofSize: 16)
        let identifierL = object_sender.send_label()
        identifierL.textColor = .black
        identifierL.numberOfLines = 0
        identifierL.font = .systemFont(ofSize: 14)
        identifierL.textColor = .darkGray
        
        
        self.addSubview(view)
        self.addSubview(titleL)
        self.addSubview(identifierL)
        
        
        view.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(8)
            $0.width.equalTo(view.snp.height)
        }
        titleL.snp.makeConstraints{
            $0.leading.equalTo(view.snp.trailing).offset(20)
            $0.top.equalTo(view.snp.top)
        }
        identifierL.snp.makeConstraints{
            $0.leading.equalTo(titleL.snp.leading)
            $0.top.equalTo(titleL.snp.bottom).offset(4)
            $0.bottom.equalTo(view.snp.bottom).offset(-4)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        view.image = image
        titleL.text = title
        identifierL.text = identifier
        
    }
    
    
    
    func image_visualTitle_viewComponent(image: UIImage, effect: UIBlurEffect, title: String, font: UIFont, textColor: UIColor, textAligment: NSTextAlignment, handleTap: @escaping VoidCallback) {
        
        self.backgroundColor = .white
        
        let visualEffect = UIVisualEffectView()
        
        //İmage nesnesi dışarıdan configure edilecek.
        let image_view = object_sender.send_imageView()

        //Label text, font, textColor, aligment gibi özellikleri configure edilecektir.
        let visualTitle = object_sender.send_label()
        visualTitle.numberOfLines = 0
        
        
        //MARK: SetupUI
        self.addSubview(image_view)
        image_view.addSubview(visualEffect)
        visualEffect.contentView.addSubview(visualTitle)
        
        //MARK: Constarints
        image_view.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        visualEffect.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(image_view).dividedBy(4)
        }
        visualTitle.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
        //MARK: Configure
        image_view.image = image
        visualEffect.effect = effect
        visualTitle.text = title
        visualTitle.font = font
        visualTitle.textColor = textColor
        visualTitle.textAlignment = textAligment
        
        
        self.onTap(handler: handleTap)
        
    }
    
    
    func icon_title_button_viewComponent(icon: UIImage, title: String, textColor: UIColor, font: UIFont, background: UIColor, handleTap: @escaping VoidCallback) {
        
        self.backgroundColor = background
        
        let iconI = object_sender.send_imageView()
        iconI.contentMode = .scaleAspectFit
        let titleL = object_sender.send_label()
        let buttonI = object_sender.send_imageView()
        let url = URL(string: "https://img.icons8.com/?size=100&id=86516&format=png&color=000000")
        buttonI.kf.setImage(with: url)
        buttonI.contentMode = .scaleAspectFit
        
        //MARK: setupUI
        self.addSubview(iconI)
        self.addSubview(titleL)
        self.addSubview(buttonI)
        
        //MARK: setupConstraints
        iconI.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.width.equalTo(50)
        }
        titleL.snp.makeConstraints{
            $0.leading.equalTo(iconI.snp.trailing).offset(24)
            $0.centerY.equalToSuperview()
        }
        buttonI.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(25)
        }
        
        //MARK: configureUI
        iconI.image = icon
        titleL.text = title
        titleL.textColor = textColor
        titleL.font = font
        self.onTap(handler: handleTap)
        
    }
    
    var indicator_view: UIImageView? {
            get {
                return objc_getAssociatedObject(self, &indicator_key) as? UIImageView
            }
            set {
                objc_setAssociatedObject(self, &indicator_key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
    }
    
    
    func startIndicator() {
        
        indicator_view = object_sender.send_imageView()
        let url = URL(string: "https://img.icons8.com/?size=100&id=102478&format=png&color=000000")
        indicator_view?.kf.setImage(with: url)
        indicator_view?.contentMode = .scaleAspectFit
        
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = 2 * Double.pi
        rotation.duration = 1.0
        rotation.repeatCount = .infinity
        indicator_view?.layer.add(rotation, forKey: "spin")
        
        
        self.addSubview(indicator_view!)
        indicator_view?.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50)
            $0.width.height.equalTo(50)
        }
        
    }
    
    
    func stopIndicator() {
        indicator_view?.layer.removeAllAnimations()
        indicator_view?.removeFromSuperview()
    }
    
    
    func topIcon_bottomTitleTapped_ViewComponent(icon: UIImage, title: String, font: UIFont? = nil, textColor: UIColor? = nil, textAligment: NSTextAlignment, handleTap: @escaping VoidCallback) {
        
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        
        let iconI = object_sender.send_imageView()
        let titleL = object_sender.send_label()
        
        //MARK: Configure
        iconI.image = icon
        iconI.contentMode = .scaleAspectFit
        
        titleL.text = title
        titleL.font = font
        titleL.textColor = textColor
        titleL.textAlignment = textAligment
        
        self.onTap(handler: handleTap)
        
        //MARK: setUI
        self.addSubview(iconI)
        self.addSubview(titleL)
        
     
        //MARK: setup_Constraints
        iconI.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-20)
            $0.width.height.equalTo(40)
        }
        titleL.snp.makeConstraints{
            $0.top.equalTo(iconI.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
    }
    
}

private struct object_sender {
    
    public static func send_imageView() -> UIImageView {
        let view = UIImageView()
        return view
    }
    
    public static func send_label() -> UILabel {
        let label = UILabel()
        return label
    }
    
}

private struct AssociatedKeys {
    static var tapHandler = "tapHandler"
}


