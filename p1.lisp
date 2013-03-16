(in-package "KR")

(create-schema :top)

(create-schema :unit (:is-a :top))
(create-schema :distance-unit (:is-a :unit))
(set-value :distance-unit :type :meter)

(create-schema :quantity (:is-a :top))
(create-schema :distance (:is-a :quantity))
(set-value :distance :unit :distance-unit)
(set-value :distance :value 300)
(get-value :distance :unit)
(get-slots :distance)

(get-value :distance-unit)



(create-schema :weight (:is-a :quantity))
(create-schema :time (:is-a :quantity))
(create-schema :rate (:is-a :quantity))


