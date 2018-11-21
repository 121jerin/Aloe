//
//  ViewController.swift
//  Aloe
//
//  Created by Thomas chacko on 21/11/18.
//  Copyright © 2018 Thomas chacko. All rights reserved.
//


import AloeStackView
import UIKit

public class ViewController: AloeStackViewController {

     public override func viewDidLoad() {
        super.viewDidLoad()
        setUpSelf()
        setUpDescriptionRow()
        setUpPhotoRow()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func setUpSelf() {
        title = "AloeStackView Example"
    }
    

    private func setUpDescriptionRow() {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.text = "This simple app shows some ways you can use AloeStackView to lay out a screen in your app.34f34f3 4 34f34fr 34 fr34 f34f 3 f3f 34f 34f 34f 34f 34f 434r3f 3f 34 f34f 3f34f 34f 34f 3f34g 3f 3f34fg3f4f ewrerf "
        
        stackView.addRow(label)
        stackView.setBackgroundColor(forRow: label, color: .red)
    }
    
    private func setUpPhotoRow() {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel.numberOfLines = 0
        titleLabel.text = "Handle user interaction"
        stackView.addRow(titleLabel)
        stackView.hideSeparator(forRow: titleLabel)
        stackView.setInset(forRow: titleLabel, inset: UIEdgeInsets(
            top: stackView.rowInset.top,
            left: stackView.rowInset.left,
            bottom: 4,
            right: stackView.rowInset.right))
        
        let captionLabel = UILabel()
        captionLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        captionLabel.textColor = .blue
        captionLabel.numberOfLines = 0
        captionLabel.text = "(Try tapping on the photo!)"
        stackView.addRow(captionLabel)
        stackView.hideSeparator(forRow: captionLabel)
        stackView.setInset(forRow: captionLabel, inset: UIEdgeInsets(
            top: 0,
            left: stackView.rowInset.left,
            bottom: stackView.rowInset.bottom,
            right: stackView.rowInset.right))
        
        guard let image = UIImage(named: "lobster-dog") else { return }
        let aspectRatio = image.size.height / image.size.width
        
        let imageView = UIImageView(image: image)
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: aspectRatio).isActive = true
        
        stackView.addRow(imageView)
        stackView.setTapHandler(forRow: imageView) { [weak self] _ in
            guard let self = self else { return }
            let vc = PhotoViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }



}

