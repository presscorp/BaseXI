//
//  UIImage+extension.swift
//  
//
//  Created by Zhalgas Baibatyr on 15.06.2023.
//

import UIKit

public extension UIImage {

    /// Get resized image by keeping its aspect ratio
    ///
    /// - Parameter size: maximum size
    /// - Returns: resized image
    func fitted(in size: CGSize) -> UIImage {
        let newSize: CGSize
        let aspectRatio = self.size.width / self.size.height

        if aspectRatio < 1 {
            let width = size.height * aspectRatio
            if width > size.width {
                let newHeight = size.width / aspectRatio
                newSize = CGSize(width: size.width, height: newHeight)
            } else {
                newSize = CGSize(width: width, height: size.height)
            }
        } else {
            let height = size.width / aspectRatio
            if height > size.height {
                let newWidth = size.height * aspectRatio
                newSize = CGSize(width: newWidth, height: size.height)
            } else {
                newSize = CGSize(width: size.width, height: height)
            }
        }

        return resized(to: newSize)
    }

    /// Get resized image
    ///
    /// - Parameter size: new image size
    /// - Returns: resized UIImage object
    func resized(to size: CGSize) -> UIImage {
        return autoreleasepool {
            let imageRenderer = UIGraphicsImageRenderer(size: size, format: imageRendererFormat)
            let image = imageRenderer.image { _ in
                let rect = CGRect(origin: .zero, size: size)
                draw(in: rect)
            }

            return image
        }
    }

    /// Get image centered inside the transparent area with provided size;
    /// If provided width (height) is less than the original width (height) then return fitted then centered image
    func centered(in size: CGSize) -> UIImage {
        if size.width < self.size.width || size.height < self.size.height {
            return fittedThenCenterd(in: size)
        }

        return autoreleasepool {
            let imageRenderer = UIGraphicsImageRenderer(size: size, format: imageRendererFormat)
            let image = imageRenderer.image { _ in
                let x = (size.width - self.size.width) / 2
                let y = (size.height - self.size.height) / 2
                let origin = CGPoint(x: x, y: y)
                draw(at: origin)
            }
            return image
        }
    }

    /// Fit image for provided size then center in it so the unfilled space is transparent
    /// - Parameter size: final image size
    /// - Returns: UIImage if possible
    func fittedThenCenterd(in size: CGSize) -> UIImage {
        return fitted(in: size).centered(in: size)
    }
}
