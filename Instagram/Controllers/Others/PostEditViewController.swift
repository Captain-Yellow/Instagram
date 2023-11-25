//
//  PostEditViewController.swift
//  Instagram
//
//  Created by Mohammad Afshar on 25/11/2023.
//

import CoreImage
import UIKit

class PostEditViewController: UIViewController {
    private let image: UIImage
    private var filters = [UIImage]()
    
    private let imageView: UIImageView = {
        let custom = UIImageView()
        custom.clipsToBounds = true
        custom.contentMode = .scaleAspectFill
        return custom
    }()

    /// Dont Forget: Create a UICollectionViewCell Class -> set identifier -> do any change -> layoutSubviews -> prepareForReuse -> add Subview -> Set Delegate and dataSource
    private let collectionViewFlowLayout: UICollectionView = {
        let CollectionViewLayout = UICollectionViewFlowLayout()
        CollectionViewLayout.scrollDirection = .horizontal
        CollectionViewLayout.minimumLineSpacing = 0
        CollectionViewLayout.minimumInteritemSpacing = 2
        CollectionViewLayout.sectionInset = UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
        
        let CollectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewLayout)
        CollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identity)
        CollectionView.backgroundColor = .secondarySystemBackground
        
        return CollectionView
    }()
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Edit"
        
        imageView.image = image
        view.addSubview(imageView)
        
        setupFilers()
        collectionViewFlowLayout.delegate = self
        collectionViewFlowLayout.dataSource = self
        view.addSubview(collectionViewFlowLayout)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.filterImage(image: self.image)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(didTapNext))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.width)
        collectionViewFlowLayout.frame = CGRect(x: 10, y: imageView.bottom + 10, width: view.width, height: 100)
    }
    
    private func filterImage(image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        let filter = CIFilter(name: "CIColorMonochrome")
//        filter?.setValue(CIImage.oriented(forExifOrientation: Int32(image.imageOrientation.rawValue)), forKey: kCIInputImageKey)
        filter?.setValue(CIImage(cgImage: cgImage), forKey: "inputImage")
        filter?.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: "inputColor")
        filter?.setValue(1.0, forKey: "inputIntensity")
        
        guard let outputImage = filter?.outputImage else { return }
        let contex = CIContext()
        if let outputcgImage = contex.createCGImage(outputImage, from: outputImage.extent) {
            let filtredImage = UIImage(cgImage: outputcgImage)
            imageView.image = filtredImage
        }
    }
    
    func setupFilers() {
        guard let filterImage = UIImage(systemName: "camera.filters") else { return }
        filters.append(filterImage)
    }

    @objc func didTapNext() {
        guard let image = imageView.image else { return }
        let captionVC = CaptionViewController(image: image)
        captionVC.title = "Add Caption"
        navigationController?.pushViewController(captionVC, animated: true)
    }
}

extension PostEditViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identity, for: indexPath) as? PhotoCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: filters[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        filterImage(image: image)
    }
}
