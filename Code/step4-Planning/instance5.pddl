(define (problem scheduling) (:domain schedule)
(:objects activity5 - agenda
          room5 - room 
          vav5 - vavbox
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
       
    (connected vav5 room5)
    (= (comfort-max-limit room5) 77.5)
    (= (comfort-min-limt room5) 66.4)
    (= (current-temp room5) 68.8) ;71.87
    (= (vav-energy-vfast room5) 0.0953)
    (= (vav-energy-fast room5) 0.0762)
    (= (vav-energy-slow room5) 0.0572)
    (= (vav-energy-vslow room5) 0.038)
    (= (vav-energy-on room5) 0.01907)
    (= (vav-energy-idle room5) 0.00003)

    (= (ahu-energy-vfast room5) 0.064)
    (= (ahu-energy-fast room5) 0.051)
    (= (ahu-energy-slow room5) 0.039)
    (= (ahu-energy-vslow room5) 0.026)
    (= (ahu-energy-on room5) 0.013)
    (= (ahu-energy-idle room5) 0.0)
    
;;;;;;;;;;;======================================;;;;;;; 
    (at 0.0 (not (working-day activity5 room5)))
    (at 10.0 (working-day activity5 room5))
    (at 131.0 (not (working-day activity5 room5)))

    (at 0.0 (not (running ahu1)))
    (at 10.0 (running ahu1))
    (at 131.0 (not (running ahu1)))

)

(:goal (and
        ;(started ahu1)
       (> (timer activity5) 119.0)
))

(:metric minimize (total-energy))
;(:metric maximize (total-thermalcomfort))
;(:metric minimize (/ (+ (total-thermalcomfort)(total-energy)) 2))
)
