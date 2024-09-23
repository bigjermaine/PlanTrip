//
//  CoreDataManager.swift
//  PlanTrip
//
//  Created by MacBook AIR on 22/09/2024.
//

import Foundation
import CoreData


class CoreDataManager:ObservableObject {

  let container:NSPersistentContainer
  @Published var savedEntity: [Trip] = []

  init(){
      //container of coredata like a storage unit
         container = NSPersistentContainer(name: "CoreDataModel")
         container.loadPersistentStores { description, error in
             if let error = error  {
                 print(error.localizedDescription)
             }else {
                 print("success")
             }
         }
       fetchTrips()
     }

  func fetchTrips() {
         let request =  NSFetchRequest<Trip>(entityName:"Trip")

         do{
             savedEntity = try container.viewContext.fetch(request)
         }catch let error {
             print(error.localizedDescription)
         }

     }
  func addTrip(name: String, style: String?, description: String?, city: String?, start: String?, end: String?) {
         let newTrip = Trip(context: container.viewContext)
         newTrip.tripName = name
         newTrip.tripStyle = style
         newTrip.city = city
         newTrip.startDate = start
         newTrip.endDate = end
         saveBooking()
      }
   func saveBooking() {
         do {
             try  container.viewContext.save()
           fetchTrips()
         }catch{
             print(error.localizedDescription)
         }
     }

  func delete(index:IndexSet) {
         guard let index = index.first else {return}
         let entity = savedEntity[index]
         container.viewContext.delete(entity)
         saveBooking()
     }
}
