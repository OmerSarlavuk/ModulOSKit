//
//  ReadyNotification.swift
//  Pods
//
//  Created by Ahlatci on 30.07.2024.
//


import UIKit
import SnapKit
import Kingfisher


open class ReadyNotification {
    
    public enum State {
        case success, failure, information
    }
    
    public enum ButtonTitle {
        case OK
        case YES
        case NO
        case APPROVE
        case REJECT
    }
    
    private func hasValue_ButtonTitle(value: Int) -> String {
        
        switch value {
        case 0:
            return "Ok"
        case 1:
            return "Yes"
        case 2:
            return "No"
        case 3:
            return "Approve"
        case 4:
            return "Reject"
        default:
            return "Ok"
        }
        
    }
    
    lazy private var alertView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy private var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy private var title: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy private var button: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    public static func showAlert(on parentView: UIView, state: State, title: String, buttonTitle: ButtonTitle, buttonAction: (() -> Void)? = nil) {
        ReadyNotification().configure(
                parentView: parentView,
                state: state,
                title: title,
                buttonTitle: buttonTitle,
                buttonAction: buttonAction)
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
    
    
    private func configure(parentView: UIView, state: State, title: String, buttonTitle: ButtonTitle, buttonAction: (() -> Void)? = nil) {
        
        parentView.addSubview(alertView)
        alertView.frame = CGRect(
            x: (parentView.frame.width - 300) / 2,
            y: (parentView.frame.height - 250) / 2,
            width: 300,
            height: 250
        )
        
        setupAlertUI()
        
        switch state {
            
        case .failure:
            state_failure()
        case .information:
            state_information()
        case .success:
            state_success()
            
        }
        
        self.title.text = title
        button.setTitle(self.hasValue_ButtonTitle(value: buttonTitle.hashValue),
                        for: .normal)
        
        if #available(iOS 14.0, *) {
                   button.addAction(UIAction(handler: { handler in //order usage [weak self] _ in but 'weak' not usage self?.alertView.removeFromSuperView()
                       buttonAction?()
                       self.alertView.removeFromSuperview()
                   }), for: .touchUpInside)
               } else {
                   //else state now empty :))
               }
        
    }
    
    private func state_failure() {
        let url = URL(string: "https://img.icons8.com/?size=100&id=VACKPnlQAC59&format=png&color=000000")
        imageView.kf.setImage(with: url)
        button.backgroundColor = UIColor(red: 0.820, green: 0.341, blue: 0.318, alpha: 1)
    }
    
    private func state_success() {
        let url = URL(string: "https://img.icons8.com/?size=100&id=70yRC8npwT3d&format=png&color=000000")
        imageView.kf.setImage(with: url)
        button.backgroundColor = UIColor(red: 0.282, green: 0.616, blue: 0.447, alpha: 1)
    }
    
    private func state_information() {
        let url = URL(string: "https://img.icons8.com/?size=100&id=63308&format=png&color=000000")
        imageView.kf.setImage(with: url)
        button.backgroundColor = UIColor(red: 0.282, green: 0.588, blue: 0.925, alpha: 1)
    }
    
}


