import EventKit

class MyCalendar {
    let eventStore: EKEventStore = EKEventStore()
    let defaultCalendar: EKCalendar?

    init() {
        defaultCalendar = eventStore.defaultCalendarForNewEvents
        eventStore.requestAccess(to: EKEntityType.event, completion: {(granted, error) in 
        if let error = error { print(error) }
        })
    }

    func getDefaultCalendar() -> String? {
        if let defaultCalendar = defaultCalendar { return defaultCalendar.title }
        return "No default calendar found"
    }

    func saveEvent(_ json: [String: Any], _ completion: @escaping(Bool) -> ()) {
        let event = EKEvent(eventStore: eventStore)

        event.calendar = defaultCalendar
        event.title = json["title"] as? String
        event.isAllDay = true

        if let date = json["date"] as? [String: Int] {
            let cal = Calendar(identifier: .gregorian)
            let components = DateComponents(year: date["year"], month: date["month"], day: date["day"], hour: date["hour"], minute: date["minute"] )
            event.startDate = cal.date(from: components)!
            event.endDate = event.startDate
        } else {
            event.startDate = Date()
            event.endDate = Date()
        }

        do {
            try eventStore.save(event, span: EKSpan.thisEvent, commit: true)
            completion(true)
        } catch {
            print(error.localizedDescription)
            completion(false)
        }
    }   
}