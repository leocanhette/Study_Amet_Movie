protocol MovieListPresenter: MovieErrorPresenter, EmptyPresenter, LoadingPresenter {
    func show(movies: [MovieViewModeling])
}
