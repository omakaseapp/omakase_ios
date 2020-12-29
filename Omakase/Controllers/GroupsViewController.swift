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
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    // MARK: Vars & Constants
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var groups: [Group] = []
    
    // MARK: Init & Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func fetchGroups() {
        // fetch data from core data to display in collectionview
        
        do {
            try self.groups = context.fetch(Group.fetchRequest())
            DispatchQueue.main.async {
                self.groupsCollectionView.reloadData()
            }
        } catch {
            
        }
    }
    
    private func addGroup() {
        // create a Group object
        let newGroup = Group(context: self.context)
        newGroup.name = "New Group"
        newGroup.friends = [Friend]()
        
        // save data
        do {
            try self.context.save()
        } catch {
            
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
            
        }
        self.fetchGroups()
    }
    
    private func deleteGroup() {
        let group = groups[0]
        context.delete(group)
        do {
            try self.context.save()
        } catch {
            
        }
        self.fetchGroups()
    }

}
