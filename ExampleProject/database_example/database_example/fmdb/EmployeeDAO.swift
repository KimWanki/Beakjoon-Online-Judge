//
//  EmployeeDAO.swift
//  database_example
//
//  Created by WANKI KIM on 2021/11/01.
//

import Foundation
import FMDB

enum EmpStateType: Int {
    case ING = 0, STOP, OUT
    
    func desc() -> String {
        switch self {
        case .ING:
            return "재직중"
        case .STOP:
            return "휴직"
        case .OUT:
            return "퇴사"
        }
    }
}

class EmployeeDAO {
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
        let dbSource = Bundle.main.path(forResource: "hr", ofType: "sqlite")
        
        if !fileManager.fileExists(atPath: dbPath) {
            let dbSource = Bundle.main.path(forResource: "hr", ofType: "sqlite")
            dbSource.flatMap { try? fileManager.copyItem(atPath: $0, toPath: dbPath) }
        }
        
        let db = FMDatabase(path: dbPath)
        return db
    }()
    
    func find() -> [EmployeeVO]? {
        guard let fmdb = wfmdb else { return nil }
        var employeeList = [EmployeeVO]()
        
        do {
            let sql = """
                SELECT emp_cd, emp_name, join_date, state_cd, department.depart_title
                FROM
                JOIN department ON department.depart_cd = employee.depart_cd
                ORDER BY employee.depart_cd ASC
            """
            
            let rs = try fmdb.executeQuery(sql, values: nil)
            
            while rs.next() {
                var record = EmployeeVO()
                
                record.empCd = Int(rs.int(forColumn: "emp_cd"))
                record.empName = rs.string(forColumn: "emp_name")!
                record.joinDate = rs.string(forColumn: "join_date")!
                record.departTitle = rs.string(forColumn: "depart_title")!
                
                let cd = Int(rs.int(forColumn: "state_cd"))
                record.stateCd = EmpStateType(rawValue: cd)!
                
                employeeList.append(record)
            }
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        return employeeList
    }
    
    func get(empCd: Int) -> EmployeeVO? {
        guard let fmdb = wfmdb else { return nil }
        let sql = """
            SELECT emp_cd, emp_name, join_date, state_cd, department.depart_title
            FROM employee
            JOIN department ON department.depart_cd = employee.depart_cd
            WHERE emp_cd = ?
        """
        let rs = fmdb.executeQuery(sql, withArgumentsIn: [empCd])
        
        return rs.flatMap {
            $0.next()
            
            var record = EmployeeVO()
            
            record.empCd = Int($0.int(forColumn: "emp_cd"))
            record.empName = $0.string(forColumn: "emp_name")!
            record.joinDate = $0.string(forColumn: "join_date")!
            record.departTitle = $0.string(forColumn: "depart_title")!
            
            let cd = Int($0.int(forColumn: "state_cd"))
            record.stateCd = EmpStateType(rawValue: cd)!
            
            return record
        }
    }
}
