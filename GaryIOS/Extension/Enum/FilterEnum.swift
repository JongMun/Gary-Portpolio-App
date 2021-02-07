//
//  FilterEnum.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/04.
//

import Foundation
import CoreImage

enum FilterColorEffect: String, CaseIterable {
    case CIColorCrossPolynomial = "CIColorCrossPolynomial"
    case CIColorCube = "CIColorCube"
    case CIColorCubeWithColorSpace = "CIColorCubeWithColorSpace"
    case CIColorInvert = "CIColorInvert"
    case CIColorMap = "CIColorMap"
    case CIColorMonochrome = "CIColorMonochrome"
    case CIColorPosterize = "CIColorPosterize"
    case CIFalseColor = "CIFalseColor"
    case CIMaskToAlpha = "CIMaskToAlpha"
    case CIMaximumComponent = "CIMaximumComponent"
    case CIMinimumComponent = "CIMinimumComponent"
    case CIPhotoEffectChrome = "CIPhotoEffectChrome"
    case CIPhotoEffectFade = "CIPhotoEffectFade"
    case CIPhotoEffectInstant = "CIPhotoEffectInstant"
    case CIPhotoEffectMono = "CIPhotoEffectMono"
    case CIPhotoEffectNoir = "CIPhotoEffectNoir"
    case CIPhotoEffectProcess = "CIPhotoEffectProcess"
    case CIPhotoEffectTonal = "CIPhotoEffectTonal"
    case CIPhotoEffectTransfer = "CIPhotoEffectTransfer"
    case CISepiaTone = "CISepiaTone"
    case CIVignette = "CIVignette"
    case CIVignetteEffect = "CIVignetteEffect"
}
	
enum FilterAdjustColor: CaseIterable {
    case CIColorClamp
    case CIColorControls
    case CIColorMatrix
    case CIColorPolynomial
    case CIExposureAdjust
    case CIGammaAdjust
    case CIHueAdjust
    case CILinearToSRGBToneCurve
    case CISRGBToneCurveToLinear
    case CITemperatureAndTint
    case CIToneCurve
    case CIVibrance
    case CIWhitePointAdjust
}

enum FilterStylize: CaseIterable {
    case CIBlendWithAlphaMask
    case CIBlendWithMask
    case CIBloom
    case CIComicEffect
    case CIConvolution3X3
    case CIConvolution5X5
    case CIConvolution7X7
    case CIConvolution9Horizontal
    case CIConvolution9Vertical
    case CICrystallize
    case CIDepthOfField
    case CIEdges
    case CIEdgeWork
    case CIGloom
    case CIHeightFieldFromMask
    case CIHexagonalPixellate
    case CIHighlightShadowAdjust
    case CILineOverlay
    case CIPixellate
    case CIPointillize
    case CIShadedMaterial
    case CISpotColor
    case CISpotLight
}
