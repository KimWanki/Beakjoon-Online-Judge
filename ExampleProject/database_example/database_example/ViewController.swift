//
//  ViewController.swift
//  database_example
//
//  Created by WANKI KIM on 2021/10/30.
//

import UIKit

enum SQLiteError: Error {
    case NotFoundPath
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dbPath = try? getDBPath()
        dbPath.flatMap { self.executeDB(dbPath: $0) }
    }
}

extension ViewController {
    func getDBPath() throws -> String? {
        let fileMgr = FileManager.default
        guard let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
        
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path
        
        if fileMgr.fileExists(atPath: dbPath) == false {
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")
            dbSource.flatMap { try? fileMgr.copyItem(atPath: $0, toPath: dbPath) }
        }
        
        return dbPath
    }
    
    func copyDatabaseIfNeeds() {
        let fileMgr = FileManager.default
        guard let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return }
        
        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path
        
        if fileMgr.fileExists(atPath: dbPath) == false {
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")
            dbSource.flatMap { try? fileMgr.copyItem(atPath: $0, toPath: dbPath) }
        }
    }
    
    func executeDB(dbPath: String) {
        var db: OpaquePointer? = nil // SQLite 연결 정보를 담을 객체
        // DB 연결
        guard sqlite3_open(dbPath, &db) == SQLITE_OK else {
            print("Database Connect Fail")
            return
        }
        
        // DB 연결 해제
        defer {
            print("Close Database Connection")
            sqlite3_close(db)
        }
        
        var stmt: OpaquePointer? = nil // 컴파일된 SQL을 담을 객체
        // SQL Query Statement
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        
        // SQL 컴파일
        guard sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK else {
            print("Prepare statement Fail")
            return
        }
        // 컴파일된 SQL 객체 해제
        defer {
            print("Finalize Statement")
            sqlite3_finalize(stmt)
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            print("Create Table Success!")
        }
    }
    
}

extension ViewController {
    func beforeRefactor() {
        // Do any additional setup after loading the view.
        var db: OpaquePointer? = nil    // SQLite 연결 정보를 담을 객체
        var stmt: OpaquePointer? = nil  // 컴파일된 SQL을 담을 객체

        // MARK: 앱 내 문서 디렉터리 경로에서 SQLite DB 파일을 찾는다.
        let fileMgr = FileManager()
        guard let docPathURL = fileMgr.urls(for: .documentDirectory,
                                               in: .userDomainMask).first
        else { return }

        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path

        if fileMgr.fileExists(atPath: dbPath) == false {
            guard let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")
            else { return }
            try? fileMgr.copyItem(atPath: dbSource, toPath: dbPath)
        }

        // SQL Query Statement
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"

        // DB 연결
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            // SQL 컴파일
            if sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK {
                if sqlite3_step(stmt) == SQLITE_DONE {
                    print("Create Table Success!")
                }
                // 컴파일된 SQL 객체 해제
                sqlite3_finalize(stmt)
            } else {
                print("Prepare statement Fail")
            }
            // DB 연결 해제
            sqlite3_close(db)
        } else {
            print("Database Connect Fail")
            return
        }
    }

}
