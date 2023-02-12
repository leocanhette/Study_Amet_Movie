enum Result<T> {
    case success(T)
    case failure(MovieError)
    
    func associatedValue() -> Any {
        switch self {
        case .success(let result): return result
        case .failure(let error): return error
        }
    }
}
