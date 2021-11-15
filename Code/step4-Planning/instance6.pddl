(define (problem scheduling) (:domain schedule)
(:objects activity6 - agenda
          room6 - room 
          vav6 - vavbox
          ahu1 - ahu
)

(:init
    (= (time-lapse) 5)
    (= (time-period) 120)

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
       
    (connected vav6 room6)
    (= (comfort-max-limit room6) 77.5)
    (= (comfort-min-limt room6) 66.4)
    (= (current-temp room6) 71.87) ;71.87
    (= (vav-energy-vfast room6) 0.0535)
    (= (vav-energy-fast room6) 0.0428)
    (= (vav-energy-slow room6) 0.0321)
    (= (vav-energy-vslow room6) 0.02141)
    (= (vav-energy-on room6) 0.01071)
    (= (vav-energy-idle room6) 0.00002)

    (= (ahu-energy-vfast room6) 0.16)
    (= (ahu-energy-fast room6) 0.128)
    (= (ahu-energy-slow room6) 0.096)
    (= (ahu-energy-vslow room6) 0.064)
    (= (ahu-energy-on room6) 0.032)
    (= (ahu-energy-idle room6) 0.0)
    
;;;;;;;;;;;======================================;;;;;;; 
    (at 0.0 (not (working-day activity6 room6)))
    (at 10.0 (working-day activity6 room6))
    (at 131.0 (not (working-day activity6 room6)))

    (at 0.0 (not (running ahu1)))
    (at 10.0 (running ahu1))
    (at 131.0 (not (running ahu1)))

)

(:goal (and
        ;(started ahu1)
       (> (timer activity6) 119.0)
))

(:metric minimize (total-energy))
;(:metric maximize (total-thermalcomfort))
;(:metric minimize (/ (+ (total-thermalcomfort)(total-energy)) 2))
)
