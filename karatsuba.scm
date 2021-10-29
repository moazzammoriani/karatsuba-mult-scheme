(define (count-digits n)
  (if (< n 10) 
      1
      (+ 1
         (count-digits (/ n 10)))))

(define (karatsuba-mult s t)
  (if (< (max s t)  10) 
      (* s t)
      (let ((n (floor (/ (count-digits (max s t)) 2))))
        (let ((a (floor (/ s (expt 10 n))))
              (b (remainder s (expt 10 n)))
              (c (floor (/ t (expt 10 n))))
              (d (remainder t (expt 10 n))))
          (let ((ac (karatsuba-mult a c))
                (bd (karatsuba-mult b d)))
            (let ((middle-coeff (- (karatsuba-mult (+ a b) (+ c d)) ac bd)))
              (+ (* (expt 10 (* 2 n)) ac) 
                 (* (expt 10 n) middle-coeff) 
                 bd)))))))



          
