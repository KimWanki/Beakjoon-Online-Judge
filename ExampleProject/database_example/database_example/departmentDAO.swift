//
//  departmentDAO.swift
//  database_example
//
//  Created by WANKI KIM on 2021/11/01.
//

import Foundation
import FMDB

class DepartmentDAO {
    // 부서 정보를 담을 튜플 타입 정의
    typealias DepartRecord = (Int, String, String)
    
    init() {
        self.wfmdb?.open()
    }
    
    deinit {
        self.wfmdb?.close()
    }
    
    lazy var wfmdb: FMDatabase? = {
        let fileManager = FileManager.default
        
        let docPath = fileManager.urls(for: .documentDirectory,
                                          in: .userDomainMask).first
        
        guard let dbPath = docPath?.appendingPathComponent("hr.sqlite").path
        else { return nil }
        print(dbPath)
        if fileManager.fileExists(atPath: dbPath) == false {
            let dbSource = Bundle.main.path(forResource: "hr", ofType: "sqlite")
//                do {
//                    try fileManager.copyItem(at: <#T##URL#>, to: <#T##URL#>)
//                } catch {
//                    print("error")
//                }
//            }
//            do {
//                try fileManager.copyItem(at: dbSource!, to: dbPath)
//
//                print("만들었습니다.")
//            } catch {
//                print("error")
//            }
            
            dbSource.flatMap { try? fileManager.copyItem(atPath: $0, toPath: dbPath) }
            print("만들겠습니다.")
        } else {
            print("이미 있음")
        }
        
        let db = FMDatabase(path: dbPath)
        return db
    }()
    
    // MARK: 부서 목록을 읽어올 메소드
    func find() -> [DepartRecord]? {
        guard let fmdb = wfmdb else { return nil }
        var departList = [DepartRecord]()
        do {
            let sql = """
            SELECT depart_cd, depart_title, depart_addr
            FROM department
            ORDER BY depart_cd ASC
            """
            
            let rs = try fmdb.executeQuery(sql, values: nil)
            
            while rs.next() {
                let departCd = rs.int(forColumn: "depart_cd")
                let departTitle = rs.string(forColumn: "depart_title")
                let departAddr = rs.string(forColumn: "depart_addr")
                
                departList.append(Self.DepartRecord(Int(departCd),
                                                    departTitle!,
                                                    departAddr!))
            }
        } catch let error as NSError {
            print("failed: \(error.localizedDescription)")
        }
        return departList
    }
    
    func get(departCd: Int) -> DepartRecord? {
        
        guard let fmdb = wfmdb else { return nil }
        
        let sql = """
            SELECT depart_cd, depart_title, depart_addr
            FROM department
            WHERE depart_cd = ?
        """
        
        let rs = fmdb.executeQuery(sql, withArgumentsIn: [departCd])
        
        return rs.flatMap {
            $0.next()
            
            let departId = $0.int(forColumn: "depart_cd")
            let departTitle = $0.string(forColumn: "depart_title")
            let departAddr = $0.string(forColumn: "depart_addr")
            
            return DepartRecord(Int(departId),
                                departTitle!,
                                departAddr!)
        }
    }
    
    func create(title: String, addr: String) -> Bool? {
        guard let fmdb = wfmdb else { return nil }
        
        guard title.isEmpty == false,
              addr.isEmpty == false
        else {
            return false
        }
            
        let sql = """
            INSERT INTO department (depart_title, depart_addr)
            VALUES ( ? , ? )
        """
        return fmdb.executeUpdate(sql, withArgumentsIn: [title, addr])
    }
    
    func remove(departCd: Int) -> Bool? {
        guard let fmdb = wfmdb else { return nil }
        
        let sql = "DELETE FROM department WHERE depart_cd= ? "
        return fmdb.executeUpdate(sql, withArgumentsIn: [departCd])
    }
}
