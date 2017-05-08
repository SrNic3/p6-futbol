//
//  ClassifInteractor.swift
//  P6 Futbol
//
//  Created by Daniel S on 21/12/16.
//  Copyright © 2016 Daniel S. All rights reserved.
//

import Foundation
import UIKit

class ClassifInteractor {
    
    var presenter : ClassifPresenter?
    
    init () {
        
    }
    
    
    func getTeams(page: Int) {
        
        let queue = DispatchQueue(label: "Download Queue")
        queue.async {
            let session = URLSession.shared // Crear una sesión
            
            let imgUrl = "http://apiclient.resultados-futbol.com/scripts/api/api.php?key=4ae49d401dbfc2765ce0515821214b7d&tz=Europe/Madrid&format=json&req=tables&league=1&group=1"
            let url = URL(string: imgUrl)!
            
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if error == nil && (response as! HTTPURLResponse).statusCode == 200 {
                    
                    do {
                        
                        guard let todo = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] else {
                            print("error trying to convert data to JSON")
                            return
                        }
                        let teams = todo["table"] as? [[String: Any]]
                        self.presenter?.getTeamsComplete(teams:teams!)
                        
                        NSLog("Datos descargados")
                    } catch {
                        
                    }
                } else {
                    print("Error descargando")
                }
            }
            // Arrancar la tarea
            task.resume()
        }
    }
    
    
    func getShieldWithURL(url: String, index: Int) {
        
        let queue = DispatchQueue(label: "Download Queue")
        queue.async {
            
            let session = URLSession.shared // Crear una sesión
            
            // Construir un URL. No es necesario escapar ningún carácter.
            let url = URL(string: url)!
            
            let task = session.dataTask(with: url) { (data: Data?, // Crear Data Task
                response: URLResponse?,
                error: Error?) in
                if error == nil && (response as! HTTPURLResponse).statusCode == 200 {
                    if let img = UIImage(data: data!) { // Construir imagen
                        self.presenter?.getTeamsShieldComplete(image: img, index: index)
                        //                        for index in 1...9999 {
                        //                            for index in 1...99990 {
                        
                        //                           }
                        //                       }
                    } else {
                        print("Error construyendo la imagen")
                    }
                } else {
                    print("Error descargando")
                }
            }
            // Arrancar la tarea
            task.resume()            
        }
        
    }
    
    
    
    
}
