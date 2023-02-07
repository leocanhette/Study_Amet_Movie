enum MovieViewState {
    case initial
    case empty
    case error(description: String)
}


extension MovieViewState {
    var title: String {
        switch self {
        case .initial:
            return "Pesquisa por título"
        case .empty:
            return "Nenhum resultado encontrado"
        case .error:
            return "Falha na tentativa"
        }
    }
    
    var subtitle: String {
        switch self {
        case .initial:
            return "Pesquise seus filmes favoritos por parte do título ou pelo título completo."
        case .empty:
            return "Nenhum filme encontrado com o título pesquisado."
        case .error(let description):
            return description
        }
    }
}
