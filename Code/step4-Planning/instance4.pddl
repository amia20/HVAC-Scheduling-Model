(define (problem scheduling) (:domain schedule)
(:objects activity4 - agenda
          room4 - room 
          vav4 - vavbox
          ahu1 - ahu
)

(:init
    (= (time-lapse) 5)
    (= (time-period) 90)

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
       
    (connected vav4 room4)
    (= (comfort-max-limit room4) 77.5)
    (= (comfort-min-limt room4) 66.4)
    (= (current-temp room4) 70.27) ;71.87
    (= (vav-energy-vfast room4) 0.0671)
    (= (vav-energy-fast room4) 0.5367)
    (= (vav-energy-slow room4) 0.04025)
    (= (vav-energy-vslow room4) 0.02683)
    (= (vav-energy-on room4) 0.01344)
    (= (vav-energy-idle room4) 0.00002)

    (= (ahu-energy-vfast room4) 0.14)
    (= (ahu-energy-fast room4) 0.112)
    (= (ahu-energy-slow room4) 0.084)
    (= (ahu-energy-vslow room4) 0.056)
    (= (ahu-energy-on room4) 0.028)
    (= (ahu-energy-idle room4) 0.0)
    
;;;;;;;;;;;======================================;;;;;;; 
    (at 0.0 (not (working-day activity4 room4)))
    (at 10.0 (working-day activity4 room4))
    (at 101.0 (not (working-day activity4 room4)))

    (at 0.0 (not (running ahu1)))
    (at 10.0 (running ahu1))
    (at 101.0 (not (running ahu1)))

)

(:goal (and
        ;(started ahu1)
       (> (timer activity4) 89.0)
))

(:metric minimize (total-energy))
;(:metric maximize (total-thermalcomfort))
;(:metric minimize (/ (+ (total-thermalcomfort)(total-energy)) 2))
)
