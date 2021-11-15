(define (problem scheduling) (:domain schedule)
(:objects activity3 - agenda
          room3 - room 
          vav3 - vavbox
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
       
    (connected vav3 room3)
    (= (comfort-max-limit room3) 77.5)
    (= (comfort-min-limt room3) 66.4)
    (= (current-temp room3) 70.37) ;71.87
    (= (vav-energy-vfast room3) 0.08741)
    (= (vav-energy-fast room3) 0.06993)
    (= (vav-energy-slow room3) 0.05246)
    (= (vav-energy-vslow room3) 0.03497)
    (= (vav-energy-on room3) 0.01749)
    (= (vav-energy-idle room3) 0.00002)

    (= (ahu-energy-vfast room3) 0.19)
    (= (ahu-energy-fast room3) 0.152)
    (= (ahu-energy-slow room3) 0.114)
    (= (ahu-energy-vslow room3) 0.076)
    (= (ahu-energy-on room3) 0.038)
    (= (ahu-energy-idle room3) 0.0)
    
;;;;;;;;;;;======================================;;;;;;; 
    (at 0.0 (not (working-day activity3 room3)))
    (at 10.0 (working-day activity3 room3))
    (at 101.0 (not (working-day activity3 room3)))

    (at 0.0 (not (running ahu1)))
    (at 10.0 (running ahu1))
    (at 101.0 (not (running ahu1)))

)

(:goal (and
        ;(started ahu1)
       (> (timer activity3) 89.0)
))

;(:metric minimize (total-energy))
;(:metric maximize (total-thermalcomfort))
(:metric minimize (/ (+ (total-thermalcomfort)(total-energy)) 2))
)
