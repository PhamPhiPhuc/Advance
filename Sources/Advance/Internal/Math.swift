func clamp<T>(value: T, min: T, max: T) -> T where T: SIMD, T.Scalar == Double {
    var result = value
    for componentIndex in 0..<value.scalarCount {
        assert(min[componentIndex] <= max[componentIndex])
        if result[componentIndex] < min[componentIndex] {
            result[componentIndex] = min[componentIndex]
        } else if result[componentIndex] > max[componentIndex] {
            result[componentIndex] = max[componentIndex]
        }
    }
    return result
}

func interpolate<T>(from fromValue: T, to toValue: T, alpha: Double) -> T where T: SIMD, T.Scalar == Double {
    var result = fromValue
    for componentIndex in 0..<fromValue.scalarCount {
        result[componentIndex] += (alpha * (toValue[componentIndex] - result[componentIndex]))
    }
    return result
}
