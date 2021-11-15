(define (problem scheduling) (:domain schedule)
(:objects activity1 - agenda
          room1 - room 
          vav1 - vavbox
          ahu1 - ahu
)

(:init
    (= (time-lapse) 5)
    (= (time-period) 60)

   ; (= (ahu-energy ahu1) 0.16)


    ;(= (chill-energy ahu1) 4.0)
    ;(= (total-thermalcomfort) 0.0)
    (= (thermalcomfort-vfast) 0.5) 
    (= (thermalcomfort-fast) 0.80)
    (= (thermalcomfort-slow) 0.80)
    (= (thermalcomfort-vslow) 0.5)
    (= (thermalcomfort-on) 0.2)
    (= (thermalcomfort-idle) 0.0)

    (= (temp-change-vfast) 0.17);according to percentages%
    (= (temp-change-fast) 0.13)
    (= (temp-change-slow) 0.1)
    (= (temp-change-vslow) 0.07)
    (= (temp-change-on) 0.033)
    (= (temp-change-idle) 0.17)
    ;;;;;;;;;===================================;;;;;;;;;;;
       
    (connected vav1 room1)
    (= (comfort-max-limit room1) 77.5)
    (= (comfort-min-limt room1) 66.4)
    (= (current-temp room1) 68.8) ;71.87

    (= (vav-energy-vfast room1) 0.12108)
    (= (vav-energy-fast room1) 0.09687)
    (= (vav-energy-slow room1) 0.07265)
    (= (vav-energy-vslow room1) 0.04843)
    (= (vav-energy-on room1) 0.02424)
    (= (vav-energy-idle room1) 0.00003)

    (= (ahu-energy-vfast room1) 0.205)
    (= (ahu-energy-fast room1) 0.164)
    (= (ahu-energy-slow room1) 0.123)
    (= (ahu-energy-vslow room1) 0.082)
    (= (ahu-energy-on room1) 0.041)
    (= (ahu-energy-idle room1) 0.0)
    





;;;;;;;;;;;======================================;;;;;;; 
    (at 0.0 (not (working-day activity1 room1)))
    (at 10.0 (working-day activity1 room1))
    (at 71.0 (not (working-day activity1 room1)))

    (at 0.0 (not (running ahu1)))
    (at 10.0 (running ahu1))
    (at 71.0 (not (running ahu1)))

)

(:goal (and
        ;(started ahu1)
       (> (timer activity1) 59.0)
))

(:metric minimize (total-energy))
;(:metric maximize (total-thermalcomfort))
;(:metric minimize (/ (+ (total-thermalcomfort)(total-energy)) 2))
)
