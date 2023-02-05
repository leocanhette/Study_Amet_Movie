import UIKit

// MARK: - Initializer
final class MovieListDataSource: NSObject {
    private weak var collectionView: UICollectionView?
    private let cellsPerRow: CGFloat
    private var movies: [MovieViewModeling] = []
    
    init(collectionView: UICollectionView, cellsPerRow: CGFloat) {
        self.collectionView = collectionView
        self.cellsPerRow = cellsPerRow
        
        super.init()
        
        registerCells()
        setupDataSource()
    }
    
    func setup(movies: [MovieViewModeling]) {
        self.movies = movies
        
        collectionView?.reloadData()
    }
}


// MARK: - Private Methods
private extension MovieListDataSource {
    func registerCells() {
        collectionView?.registerReusableCell(MovieCollectionCell.self)
    }
    
    func setupDataSource() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    func calculateCellSize(collectionView: UICollectionView) -> CGSize {
        let differenceAmongCells: CGFloat = Space.base01 / cellsPerRow
        let paddingAmongCells: CGFloat = Space.base01 + differenceAmongCells
        
        let width: CGFloat = (collectionView.frame.width / cellsPerRow) - paddingAmongCells
        let height: CGFloat = width + (width * 0.3)
        
        return CGSize(width: width, height: height)
    }
}



// MARK: - Extension UICollectionViewDataSource
extension MovieListDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCollectionCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        
        cell.setup(viewModel: movies[indexPath.row])        
        
        return cell
    }
}



// MARK: - Extension UICollectionViewDelegateFlowLayout
extension MovieListDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        calculateCellSize(collectionView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Space.base01
    }
}
