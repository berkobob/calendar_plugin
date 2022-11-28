# Apple Calendar Plugin - calendar_plugin

A very simply Flutter plugin to create an event in Apple calendar.

Pass an object to `saveEvent(Map Event)`:

```
            {
                'year': item.dueDate?.year,
                'month': item.dueDate?.month,
                'day': item.dueDate?.day,
                'hour': item.dueDate?.hour,
                'minute': item.dueDate?.minute
            }
```
