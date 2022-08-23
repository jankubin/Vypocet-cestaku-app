//
//  ViewController.swift
//  Výpočet Cesťáků
//
//  Created by Jan Kubín on 17.08.2022.
//

import UIKit
import MapKit
import CoreLocation



 

class ViewController: UIViewController {
    
   

    @IBOutlet weak var pocetKmTxt: UITextField!
    @IBOutlet weak var spotrebaTxt: UITextField!
    @IBOutlet weak var cenaLPhTxt: UITextField!
    @IBOutlet weak var amortizaceTxt: UITextField!
    
  
    
    @IBOutlet weak var projetolPhLbl: UILabel!
    @IBOutlet weak var amortizaceLbl: UILabel!
    @IBOutlet weak var cenaProjetychPhLbl: UILabel!
    @IBOutlet weak var celkovaCenaLbl: UILabel!
    
    @IBAction func navigaceButton(_ sender: Any)
    {
        let latitude:CLLocationDegrees = 50.07567293915004
        let longitude:CLLocationDegrees = 14.437235566404093
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Praha"
        mapItem.openInMaps(launchOptions: options)
    }
    
    @IBAction func vypocitatButton(_ sender: Any) {
        // Nepoužívej "!". Vždy použij náhradní hodnotu, když stávající neexistuje. Třeba `spotrebaTxt.text ?? "0"`
        let projeto:Double = ((Double(spotrebaTxt.text ?? "0") ?? 0.0) / 100) * (Double(pocetKmTxt.text ?? "0") ?? 0.0)
        let amortizace:Double = (Double(amortizaceTxt.text ?? "0") ?? 0) * (Double(pocetKmTxt.text ?? "0") ?? 0)
        let cenaProjetychPh:Double = projeto * (Double(cenaLPhTxt.text ?? "0") ?? 0)
        let celkovaCena:Double = cenaProjetychPh + amortizace
        
        projetolPhLbl.text = "Bylo projeto \(projeto) l pohonných hmot."
        amortizaceLbl.text = "Amortizace vozu je \(amortizace) Kč."
        cenaProjetychPhLbl.text = "Cena projetých pohonných hmot je \(cenaProjetychPh) Kč."
        celkovaCenaLbl.text = "Celková cena cesťáku je \(celkovaCena) Kč."
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
}
}



 



