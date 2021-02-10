//
//  PreferencesViewController.swift
//  Omakase
//
//  Created by Hanzheng Li on 2/7/21.
//

import UIKit

class PreferencesViewController: UIViewController {

    /* Implementation:
    - One UICollectionView whole screen
        - Similar to GroupsViewController: stretchy ReusableView for title
        - ReusableView for section headers too, use indexPath in viewForSupplementaryElementOfKind
    */
    
    // MARK: Subviews
    private lazy var preferencesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayoutWithStretchyHeader()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: 60.adjustedHeight)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = true
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .white
        collectionView.register(PreferenceCollectionViewCell.self, forCellWithReuseIdentifier: PreferenceCollectionViewCell.reuseIdentifier)
        collectionView.register(PreferencesReusableHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PreferencesReusableHeaderView.reuseIdentifier)
        collectionView.register(PreferencesSectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PreferencesSectionReusableView.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self

        
        return collectionView
    }()
    
    // MARK: Vars & Constants
    
    let sectionTitles: [String] = ["", "General Preferences", "Dietary Restrictions"]
    let preferenceNames: [[String]] = [
        [],
        ["Cuisine", "Favorite Restaurants", "Food Types", "Restaurant Types"],
        ["Allergies", "Diet"]
    ]
    let selectedPreferences: [[[String]]] = [
        [],
        [ // General Preferences
            ["Chinese", "American", "Korean"], // Cuisine
            ["888 Pan Asian", "Cane's Chicken Fingers"], // Favorite Restaurants
            ["Rice", "Sandwiches", "Noodle Soups"], // Food Types
            ["Hole-in-the-wall", "Fast Food"], // Restaurant Types
        ],
        [ // Dietary Restrictions
            ["Peanuts", "Shellfish", "Lactose"], // Allergies
            ["Keto", "Pescatarian"] // Diet
        ]
    ]
    
    // MARK: Init & Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(preferencesCollectionView)
        setConstraints()
    }
    
    private func setConstraints() {
        preferencesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}

extension PreferencesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return preferenceNames[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreferenceCollectionViewCell.reuseIdentifier, for: indexPath) as! PreferenceCollectionViewCell
        let preferenceName = preferenceNames[indexPath.section][indexPath.row]
        let selectedPreference = selectedPreferences[indexPath.section][indexPath.row]
        cell.configure(preferenceName: preferenceName, selectedPreferences: selectedPreference)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 0:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PreferencesReusableHeaderView.reuseIdentifier, for: indexPath) as! PreferencesReusableHeaderView
                return headerView
            case 1, 2:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PreferencesSectionReusableView.reuseIdentifier, for: indexPath) as! PreferencesSectionReusableView
                let sectionTitle = sectionTitles[indexPath.section]
                headerView.configure(sectionTitle: sectionTitle)
                return headerView
            default:
                assert(false, "Invalid section index")
            }
        default:
            assert(false, "Invalid element type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: view.frame.size.width, height: 155.adjustedTopOffset)
        case 1:
            return CGSize(width: view.frame.size.width, height: 20.adjustedHeight)
        case 2:
            return CGSize(width: view.frame.size.width, height: 63.adjustedHeight)
        default: assert(false, "Invalid section index")
        }
    }
}
