//
//  FilterEnum.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/04.
//

import Foundation
import CoreImage

enum FilterAdjustColor: String {
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

enum FilterColorEffect: String {
    case CIColorCrossPolynomial
    case CIColorCube
    case CIColorCubeWithColorSpace
    case CIColorInvert
    case CIColorMap
    case CIColorMonochrome
    case CIColorPosterize
    case CIFalseColor
    case CIMaskToAlpha
    case CIMaximumComponent
    case CIMinimumComponent
    case CIPhotoEffectChrome
    case CIPhotoEffectFade
    case CIPhotoEffectInstant
    case CIPhotoEffectMono
    case CIPhotoEffectNoir
    case CIPhotoEffectProcess
    case CIPhotoEffectTonal
    case CIPhotoEffectTransfer
    case CISepiaTone
    case CIVignette
    case CIVignetteEffect
}

enum FilterStylize: String {
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
