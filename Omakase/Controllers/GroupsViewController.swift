//
//  GroupsViewController.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/28/20.
//

import UIKit


class GroupsViewController: UIViewController {

    // MARK: Subviews
    
    private lazy var groupsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayoutWithStretchyHeader()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 15.adjustedHeight
        layout.itemSize = CGSize(width: 343.adjustedWidth, height: 146.adjustedHeight)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsSelection = false
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = true
        collectionView.register(GroupCollectionViewCell.self, forCellWithReuseIdentifier: GroupCollectionViewCell.reuseIdentifier)
        collectionView.register(GroupsReusableHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GroupsReusableHeaderView.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    // MARK: Vars & Constants
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var groups: [Group] = []
    
    // MARK: Init & Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(groupsCollectionView)
        setConstraints()
        fetchGroups()
    }
    
    private func setConstraints() {
        groupsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: Actions
    
    @objc private func addGroupButtonPressed() {
        print("group added")
        addGroup()
    }
    
    // MARK: CoreData
    
    private func getAllFriends() -> [Friend] {
        do {
            return try context.fetch(Friend.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        return [Friend]()
    }
    
    private func fetchGroups() {
        // fetch data from core data to display in collectionview
        do {
            try self.groups = context.fetch(Group.fetchRequest())
            DispatchQueue.main.async {
                self.groupsCollectionView.reloadData()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func createFriends() {
        let firstNames = ["Ryan", "Han", "Kushal", "Kevin"]
        let lastNames = ["Chu", "Li", "Dandamudi", "Joseph"]
        let propics = [
            UIImage(named: "propic_ryan")!,
            UIImage(named: "propic_han")!,
            UIImage(named: "propic_kushal")!,
            UIImage(named: "propic_kevin")!
        ]
        for i in 0...3 {
            let friend = Friend(context: self.context)
            friend.firstName = firstNames[i]
            friend.lastName = lastNames[i]
            friend.profilePhotoData = propics[i].pngData()
        }
    }
    
    private func addGroup() {
        // create a Group object
        let newGroup = Group(context: self.context)
        newGroup.name = "New Group"
        newGroup.emoji = "🤡"
        newGroup.members = NSOrderedSet(array: getAllFriends())
        // save data
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        // refresh data
        fetchGroups()
    }
    
    private func editGroup() {
        // get group
        let group = groups[0]
        group.name = "blah"
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
        self.fetchGroups()
    }
    
    private func deleteGroup() {
        let group = groups[0]
        context.delete(group)
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
        self.fetchGroups()
    }

}

extension GroupsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCollectionViewCell.reuseIdentifier, for: indexPath) as! GroupCollectionViewCell
        let row = indexPath.row
        let group = groups[row]
        cell.configure(group: group)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GroupsReusableHeaderView.reuseIdentifier, for: indexPath) as! GroupsReusableHeaderView
            headerView.configure(buttonPressedClosure: addGroupButtonPressed)
            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 155.adjustedTopOffset)
    }
}
