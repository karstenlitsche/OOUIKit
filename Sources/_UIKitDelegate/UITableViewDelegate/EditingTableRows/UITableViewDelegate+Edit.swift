//
//  UITableViewDelegate+Edit.swift
//  OOUIKit
//
//  Created by Karsten Litsche on 04.11.17.
//

import UIKit

public extension UITableViewDelegateWrap {
    
    public final func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        origin.tableView?(tableView, willBeginEditingRowAt:indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        origin.tableView?(tableView, didEndEditingRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return origin.tableView?(tableView, editingStyleForRowAt: indexPath) ?? .delete
    }
    
    public final func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return origin.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: indexPath)
    }
    
    public final func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return origin.tableView?(tableView, shouldIndentWhileEditingRowAt: indexPath) ?? true
    }
    
}

public extension UITableViewDelegateSplitting {
    
    public final func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        delegates.forEach { $0.tableView?(tableView, willBeginEditingRowAt: indexPath) }
    }
    
    public final func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        delegates.forEach { $0.tableView?(tableView, didEndEditingRowAt: indexPath) }
    }
    
    public final func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, editingStyleForRowAt: indexPath) { return result }
        }
        return .delete
    }
    
    public final func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: indexPath) { return result }
        }
        return nil
    }
    
    public final func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        for delegate in delegates {
            if let result = delegate.tableView?(tableView, shouldIndentWhileEditingRowAt: indexPath) { return result }
        }
        return true
    }
    
}
