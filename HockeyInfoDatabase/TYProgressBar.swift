//
//  TYProgressBar.swift
//
//  Created by Yash Thaker on 08/05/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//
import UIKit

class TYProgressBar: UIView
{
    var gradients: [UIColor] = [#colorLiteral(red: 0.7843137255, green: 0.4274509804, blue: 0.8431372549, alpha: 1), #colorLiteral(red: 0.1882352941, green: 0.137254902, blue: 0.6823529412, alpha: 1)]
    {
        didSet
        {
            let gradientColors = gradients.map { $0.cgColor }
            pulsingGradientLayer.colors = gradientColors
            shapeGradientLayer.colors = gradientColors
        }
    }

    var lineHeight: CGFloat = 10
    {
        didSet
        {
            trackLayer.lineWidth = lineHeight
            shapeLayer.lineWidth = lineHeight
        }
    }

    var lineDashPattern: [NSNumber] = [1, 0]
    { // lineWidth, lineGap
        didSet
        {
            trackLayer.lineDashPattern = lineDashPattern
            shapeLayer.lineDashPattern = lineDashPattern
        }
    }

    var textColor: UIColor = UIColor.white
    {
        didSet
        {
            progressLbl.textColor = textColor
        }
    }

    var font: UIFont = UIFont(name: "HelveticaNeue-Medium", size: 22)!
    {
        didSet
        {
            progressLbl.font = font
        }
    }

    var progress: Double = 0
    {
        didSet
        {
            updateProgress()
        }
    }

    private var pulsingGradientLayer: CAGradientLayer! // Masking layer
    private var pulsingLayer: CAShapeLayer!

    private var trackLayer: CAShapeLayer!

    private var shapeGradientLayer: CAGradientLayer! // masking layer
    private var shapeLayer: CAShapeLayer!

    private lazy var progressLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = textColor
        lbl.font = font
        lbl.textAlignment = .center
        return lbl
    }()

    override init(frame: CGRect)
    {
        super.init(frame: frame)

        pulsingGradientLayer = createGradientLayer() // Masking layer
        layer.addSublayer(pulsingGradientLayer)

        pulsingLayer = createShapeLayer(strokeColor: UIColor(white: 0, alpha: 0.2), fillColor: .clear)
        pulsingLayer.lineWidth = 0
        pulsingLayer.lineDashPattern = nil
        layer.addSublayer(pulsingLayer)

        pulsingGradientLayer.mask = pulsingLayer

        trackLayer = createShapeLayer(strokeColor: UIColor(white: 0.2, alpha: 0.5), fillColor: .clear)
        trackLayer.strokeEnd = 1
        layer.addSublayer(trackLayer)

        shapeGradientLayer = createGradientLayer() // Masking layer
        layer.addSublayer(shapeGradientLayer)

        shapeLayer = createShapeLayer(strokeColor: .black, fillColor: .clear)
        shapeLayer.strokeEnd = CGFloat(progress)
        layer.addSublayer(shapeLayer)

        shapeGradientLayer.mask = shapeLayer

        addSubview(progressLbl)
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()

        pulsingGradientLayer.frame = bounds
        shapeGradientLayer.frame = bounds
        progressLbl.frame = bounds

        let cx = bounds.width / 2
        let cy = bounds.height / 2
        let viewCenter = CGPoint(x: cx, y: cy)

        let radius = min(cx, cy) - (lineHeight * 2)

        let path = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)

        pulsingLayer.path = path.cgPath
        trackLayer.path = path.cgPath
        shapeLayer.path = path.cgPath

        pulsingLayer.position = viewCenter
        trackLayer.position = viewCenter
        shapeLayer.position = viewCenter

        trackLayer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
        shapeLayer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
    }

    private func updateProgress()
    {
        shapeLayer.strokeEnd = CGFloat(progress)

        let intProgress = Int(progress * 100)

        if intProgress <= 100
        {
            progressLbl.text = "\(intProgress)%"
        }

        if intProgress == 100
        {
            startPulseAnimation()
        }
        else
        {
            stopPulseAnimation()
        }

        UIView.animate(withDuration: 0.5, animations: {
            self.progressLbl.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)

        })
        { _ in
            self.progressLbl.transform = .identity
        }
    }

    private func startPulseAnimation()
    {
        pulsingLayer.lineWidth = lineHeight

        let scaleXY = 1 + (lineHeight / 100)
        let animation = CABasicAnimation(keyPath: "transform.scale.xy")
        animation.toValue = scaleXY
        animation.duration = 0.8
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)

        pulsingLayer.add(animation, forKey: "TYPulsing")
    }

    private func stopPulseAnimation()
    {
        pulsingLayer.lineWidth = 0
        pulsingLayer.removeAnimation(forKey: "TYPulsing")
    }

    private func createShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer
    {
        let layer = CAShapeLayer()
        layer.lineWidth = lineHeight
        layer.strokeColor = strokeColor.cgColor
        layer.fillColor = fillColor.cgColor
        layer.lineDashPattern = lineDashPattern
        return layer
    }

    private func createGradientLayer() -> CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        let defaultColors = gradients.map { $0.cgColor }
        gradientLayer.colors = defaultColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        return gradientLayer
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}
