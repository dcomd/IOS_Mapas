//
//  ViewController.swift
//  Mapas
//
//  Created by Alexandre de Oliveira Nepomuceno on 22/04/20.
//  Copyright © 2020 Alexandre de Oliveira Nepomuceno. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocal = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //solicitação de permissão para localizar usuario
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
        
        //configuração de mapa
//        let latitude: CLLocationDegrees  = -23.9522112
//        let longitudde : CLLocationDegrees  = -46.3390667
//
//        let deltaLatitude : CLLocationDegrees = 0.01
//        let deltaLongitude : CLLocationDegrees = 0.01
//
//        let localization : CLLocationCoordinate2D =
//            CLLocationCoordinate2DMake(latitude, longitudde)
//        let areaLocalizacao : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
//
//        let region : MKCoordinateRegion =
//            MKCoordinateRegion(center:localization,span: areaLocalizacao)
        //mapa.setRegion(region, animated:true)
//
//        //configuração do ponteiro do mapa
//        let pointAnotation = MKPointAnnotation()
//        pointAnotation.coordinate = localization
//        pointAnotation.title = "Cidade de Santos"
//        pointAnotation.subtitle = "Vila Belmiro"
//        mapa.addAnnotation(pointAnotation)

       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacaoUser : CLLocation = locations.last!
        let latitude: CLLocationDegrees  = localizacaoUser.coordinate.latitude
        let longitudde : CLLocationDegrees  = localizacaoUser.coordinate.longitude

        let deltaLatitude : CLLocationDegrees = 0.01
        let deltaLongitude : CLLocationDegrees = 0.01

        let localization : CLLocationCoordinate2D =
            CLLocationCoordinate2DMake(latitude, longitudde)
        let areaLocalizacao : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)

        let region : MKCoordinateRegion =
            MKCoordinateRegion(center:localization,span: areaLocalizacao)
        mapa.setRegion(region, animated:true)
        
    }


}

