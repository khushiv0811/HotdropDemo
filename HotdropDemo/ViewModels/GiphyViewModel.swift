//
//  GiphyViewModel.swift
//  HotdropDemo
//
//  Created by Kushboo Patel on 6/21/22.
//

import Foundation
class GiphyViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var giphydata : GiphyData!{
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    let Limit = "25"
    var Requesttype : String?
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    override init() {
        
        super.init()
        self.apiService =  APIService()
        
        callFuncToGetGiphyData(limit: Limit, type: Requesttype ?? "gif")
    }
    
    func callFuncToGetGiphyData(limit : String , type : String) {
        self.apiService.apiToGetGiphyData(limit:limit, type: type, completion: {(Giphydata) in
            self.giphydata = Giphydata
        })
    }
}
