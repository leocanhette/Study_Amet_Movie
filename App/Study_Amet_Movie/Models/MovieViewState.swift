enum MovieViewState {
    case initial
    case empty
    case error(description: String)
}


extension MovieViewState {
    var title: String {
        switch self {
        case .initial:
            return R.string.movieViewState.titleInitial()
        case .empty:
            return R.string.movieViewState.titleEmpty()
        case .error:
            return R.string.movieViewState.titleError()
        }
    }
    
    var subtitle: String {
        switch self {
        case .initial:
            return R.string.movieViewState.subtitleInitial()
        case .empty:
            return R.string.movieViewState.subtitleEmpty()
        case .error(let description):
            return description
        }
    }
}
