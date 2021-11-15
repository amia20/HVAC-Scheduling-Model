(define (domain schedule)

(:requirements :strips :adl :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types agenda room ahu vavbox)

(:predicates  (connected ?vavbox - vavbox ?room - room)
              (working-day ?agenda - agenda ?room - room) 
              (operating ?vavbox - vavbox) (running ?ahu - ahu)(started ?ahu - ahu))

(:functions (timer ?agenda - agenda) (time-lapse) (time-period)
            (comfort-max-limit ?room - room) (comfort-min-limt ?room - room) 
            (current-temp ?room - room) 
            (temp-change-vfast)
            (temp-change-fast) 
            (temp-change-slow) 
            (temp-change-vslow) 
            (temp-change-idle)
            (temp-change-on)
            
            (total-energy)

            (ahu-energy-vfast ?room - room)
            (ahu-energy-fast ?room - room) 
            (ahu-energy-slow ?room - room) 
            (ahu-energy-vslow ?room - room) 
            (ahu-energy-idle ?room - room)
            (ahu-energy-on ?room - room)

            (vav-energy-vfast ?room - room)
            (vav-energy-fast ?room - room) 
            (vav-energy-slow ?room - room) 
            (vav-energy-vslow ?room - room) 
            (vav-energy-idle ?room - room)
            (vav-energy-on ?room - room)

            (total-thermalcomfort)
            (thermalcomfort-vfast)
            (thermalcomfort-fast)
            (thermalcomfort-slow)
            (thermalcomfort-vslow)
            (thermalcomfort-on)
            (thermalcomfort-idle)

)

(:durative-action start_ahu
    :parameters (?ahu - ahu)
    :duration (= ?duration (time-period))
    :condition (and (at start (not (started ?ahu)))(over all (running ?ahu)))

    :effect (and (at start (started ?ahu))))


(:durative-action NEUTRAL 
    :parameters (?vavbox - vavbox ?room - room ?agenda - agenda ?ahu - ahu)
    :duration (= ?duration (time-lapse))
    :condition (and 
            (at start (not (operating ?vavbox)))
            (over all (connected ?vavbox ?room))
            (over all (working-day ?agenda ?room))
            (over all (started ?ahu))
            (over all (>= (current-temp ?room) (comfort-min-limt ?room) ))
	        (over all (<=(current-temp ?room)(comfort-max-limit ?room))))
    :effect (and 
            (at start (operating ?vavbox))
            (at end (not (operating ?vavbox)))
            (at end (increase (timer ?agenda) (time-lapse)))
            (at end (decrease (current-temp ?room) (* (temp-change-idle) (time-lapse))))
            (at end (increase (total-energy) (* (vav-energy-idle ?room) (time-lapse))))
            (at end (increase (total-energy) (* (ahu-energy-idle ?room) (time-lapse))))
            (at end (increase (total-thermalcomfort) (thermalcomfort-idle)))))

(:durative-action ON 
    :parameters (?vavbox - vavbox ?room - room ?agenda - agenda ?ahu - ahu)
    :duration (= ?duration (time-lapse))
    :condition (and 
            (at start (not (operating ?vavbox)))
            (over all (connected ?vavbox ?room))
            (over all (working-day ?agenda ?room))
            (over all (started ?ahu))
            (over all (>= (current-temp ?room) (comfort-min-limt ?room) ))
            (over all (<=(current-temp ?room)(comfort-max-limit ?room))))
    :effect (and 
            (at start (operating ?vavbox))
            (at end (not (operating ?vavbox)))
            (at end (increase (timer ?agenda) (time-lapse)))
            (at end (increase (current-temp ?room) (* (temp-change-on) (time-lapse))))
            (at end (increase (total-energy) (* (vav-energy-on ?room) (time-lapse))))
            (at end (increase (total-energy) (* (ahu-energy-on ?room) (time-lapse))))
            (at end (increase (total-thermalcomfort) (thermalcomfort-on)))))

(:durative-action VERY_SLOW
    :parameters (?vavbox - vavbox ?room - room ?agenda - agenda ?ahu - ahu)
    :duration (= ?duration (time-lapse))
    :condition (and 
            (at start (not (operating ?vavbox)))
            (over all (connected ?vavbox ?room))
            (over all (working-day ?agenda ?room))
            (over all (started ?ahu))
            (over all (>= (current-temp ?room) (comfort-min-limt ?room) ))
            (over all (<=(current-temp ?room)(comfort-max-limit ?room))))
    :effect (and 
            (at start (operating ?vavbox))
            (at end (not (operating ?vavbox)))
            (at end (increase (timer ?agenda) (time-lapse)))
            (at end (increase (current-temp ?room) (* (temp-change-vslow) (time-lapse))))
            (at end (increase (total-energy) (* (vav-energy-vslow ?room) (time-lapse))))
            (at end (increase (total-energy) (* (ahu-energy-vslow ?room) (time-lapse))))
            (at end (increase (total-thermalcomfort) (thermalcomfort-vslow)))))

(:durative-action SLOW 
    :parameters (?vavbox - vavbox ?room - room ?agenda - agenda ?ahu - ahu)
    :duration (= ?duration (time-lapse))
    :condition (and 
            (at start (not (operating ?vavbox)))
            (over all (connected ?vavbox ?room))
            (over all (working-day ?agenda ?room))
            (over all (started ?ahu))
            (over all (>= (current-temp ?room) (comfort-min-limt ?room) ))
            (over all (<=(current-temp ?room)(comfort-max-limit ?room))))
    :effect (and 
            (at start (operating ?vavbox))
            (at end (not (operating ?vavbox)))
            (at end (increase (timer ?agenda) (time-lapse)))
            (at end (increase (current-temp ?room) (* (temp-change-slow) (time-lapse))))
            (at end (increase (total-energy) (* (vav-energy-slow ?room) (time-lapse))))
            (at end (increase (total-energy) (* (ahu-energy-slow ?room) (time-lapse))))
            (at end (increase (total-thermalcomfort) (thermalcomfort-slow)))))

    (:durative-action FAST
    :parameters (?vavbox - vavbox ?room - room ?agenda - agenda ?ahu - ahu)
    :duration (= ?duration (time-lapse))
    :condition (and 
            (at start (not (operating ?vavbox)))
            (over all (connected ?vavbox ?room))
            (over all (working-day ?agenda ?room))
            (over all (started ?ahu))
            (over all (>= (current-temp ?room) (comfort-min-limt ?room) ))
            (over all (<=(current-temp ?room)(comfort-max-limit ?room))))
    :effect (and 
            (at start (operating ?vavbox))
            (at end (not (operating ?vavbox)))
            (at end (increase (timer ?agenda) (time-lapse)))
            (at end (increase (current-temp ?room) (* (temp-change-fast) (time-lapse))))
            (at end (increase (total-energy) (* (vav-energy-fast ?room) (time-lapse))))
            (at end (increase (total-energy) (* (ahu-energy-fast ?room) (time-lapse))))
            (at end (increase (total-thermalcomfort) (thermalcomfort-fast)))))

    (:durative-action VERY_FAST
    :parameters (?vavbox - vavbox ?room - room ?agenda - agenda ?ahu - ahu)
    :duration (= ?duration (time-lapse))
    :condition (and 
            (at start (not (operating ?vavbox)))
            (over all (connected ?vavbox ?room))
            (over all (working-day ?agenda ?room))
            (over all (started ?ahu))
            (over all (>= (current-temp ?room) (comfort-min-limt ?room)))
            (over all (<=(current-temp ?room)(comfort-max-limit ?room))))
    :effect (and 
            (at start (operating ?vavbox))
            (at end (not (operating ?vavbox)))
            (at end (increase (timer ?agenda) (time-lapse)))
            (at end (increase (current-temp ?room) (* (temp-change-vfast) (time-lapse))))
            (at end (increase (total-energy) (* (vav-energy-vfast ?room) (time-lapse))))
            (at end (increase (total-energy) (* (ahu-energy-vfast ?room) (time-lapse))))
            (at end (increase (total-thermalcomfort) (thermalcomfort-vfast))))))