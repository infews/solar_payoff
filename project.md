

- [x] setup: can run tests
- [ ] I can parse a PG&E billing CSV and see the data in the DB (console is fine)
  - [x] PgeHour
    - [x] has a date/time for start
    - [x] has a number of Wh used
    - [x] has a cost
    - [x] has a table
    - [x] can read/write to DB
  - [x] PgeCSV 
    - [x] can take a real file
    - [x] will calculate the usage and the cost
    - [x] will build an array of PgeHours
  - [ ] Script that will load the data file and put it in the DB

- [ ] I can parse a SunPower production CSV and see the data in the DB
  - [x] SunpowerHour
    - [x] has a date/time for start
    - [x] has a kWh for that time
    - [x] has a table
    - [x] can read/write to DB
  - [x] SunPowerXLS
    - [x] can take a real file
    - [x] will skip over headers
  - [ ] Script that will load the data file and put it in the DB
- [ ] I can see the production interval information that I have today
  - [ ] ProductionInterval
    - [ ] has a date/hour start
    - [ ] has a production amount of kWh
    - [ ] has a rate
    - [ ] has a value
    - [ ] has a table
    - [ ] can read/write to DB
    - [ ] can build from a PgeHour and SunPowerHour
      - [ ] should fail if they don't match
  - [ ] Script that will fill in all of the available ProductionIntervals
    - [ ] IntervalBuilder
      - [ ] find all the hours we can build ProductionIntervals but don't exist
      - [ ] build ProductionIntervals we can build 
  - [ ] Script that 
