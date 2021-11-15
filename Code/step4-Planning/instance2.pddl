(define (problem scheduling) (:domain schedule)
(:objects activity2 - agenda
          room2 - room 
          vav2 - vavbox
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
       
    (connected vav2 room2)
    (= (comfort-max-limit room2) 77.5)
    (= (comfort-min-limt room2) 66.4)
    (= (current-temp room2) 72.04) ;71.87
    (= (vav-energy-vfast room2) 0.04979)
    (= (vav-energy-fast room2) 0.03984)
    (= (vav-energy-slow room2) 0.02988)
    (= (vav-energy-vslow room2) 0.01993)
    (= (vav-energy-on room2) 0.00997)
    (= (vav-energy-idle room2) 0.00002)

    (= (ahu-energy-vfast room2) 0.199)
    (= (ahu-energy-fast room2) 0.159)
    (= (ahu-energy-slow room2) 0.119)
    (= (ahu-energy-vslow room2) 0.08)
    (= (ahu-energy-on room2) 0.04)
    (= (ahu-energy-idle room2) 0.0)
    
;;;;;;;;;;;======================================;;;;;;; 
    (at 0.0 (not (working-day activity2 room2)))
    (at 10.0 (working-day activity2 room2))
    (at 71.0 (not (working-day activity2 room2)))

    (at 0.0 (not (running ahu1)))
    (at 10.0 (running ahu1))
    (at 71.0 (not (running ahu1)))

)

(:goal (and
        ;(started ahu1)
       (> (timer activity2) 59.0)
))

(:metric minimize (total-energy))
;(:metric maximize (total-thermalcomfort))
;(:metric minimize (/ (+ (total-thermalcomfort)(total-energy)) 2))
)
