import CoreGraphics

/** The value of π as a CGFloat */
let π = CGFloat(Double.pi)

extension CGFloat {
  
  func degreesToRadians() -> CGFloat {
    return π * self / 180.0
  }

  
  func radiansToDegrees() -> CGFloat {
    return self * 180.0 / π
  }

  
  func clamped(_ v1: CGFloat, _ v2: CGFloat) -> CGFloat {
    let min = v1 < v2 ? v1 : v2
    let max = v1 > v2 ? v1 : v2
    return self < min ? min : (self > max ? max : self)
  }

  
  @discardableResult
 mutating func clamp(_ v1: CGFloat, _ v2: CGFloat) -> CGFloat {
    self = clamped(v1, v2)
    return self
  }

 
  func sign() -> CGFloat {
    return (self >= 0.0) ? 1.0 : -1.0
  }

static func randomSign() -> CGFloat {
    return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
  }
}


func shortestAngleBetween(_ angle1: CGFloat, angle2: CGFloat) -> CGFloat {
    let twoπ = π * 2.0
    var angle = (angle2 - angle1).truncatingRemainder(dividingBy: twoπ)
    if (angle >= π) {
        angle = angle - twoπ
    }
    if (angle <= -π) {
        angle = angle + twoπ
    }
    return angle
}
