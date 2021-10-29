 (define (count-digits n)
   (if (< n 10)                                                                            
       1                                                                                   
       (+ 1                                                                                
          (count-digits (/ n 10)))))                                                       
                                                                                           
 (define (floor-half n)                                                                    
   (floor (/ n 2)))                                                                        
                                                                                           
 (define (shift-rt-n num n) ;; shift num by n digits to the right                          
   (floor (/ num (expt 10 n))))                                                            
                                                                                           
 (define (overflow-lt-n num n)  ;; get rid of all the digits greater than n                
   (remainder num (expt 10 n)))                                                            
                                                                                           
 (define (karatsuba-mult s t)                                                              
   (if (< (max s t)  10) ;; base case                                                      
       (* s t)                                                                             
       (let ((n (count-digits (max s t))))                                                 
         (let ((half-n (floor-half n)))                                                    
           (let ((a (shift-rt-n s half-n))    ;; splitting the numbers into halves         
                 (b (overflow-lt-n s half-n))                                              
                 (c (shift-rt-n t half-n))                                                 
                 (d (overflow-lt-n t half-n)))                                             
             (let ((ac (karatsuba-mult a c)) ;; recursively compute sub-products           
                  (bd (karatsuba-mult b d)))                                               
               (let ((middle-coeff (- (karatsuba-mult (+ a b) (+ c d)) ac bd)))            
                 (+ (* (expt 10 (* 2 half-n)) ac)     ;; combining results                 
                    (* (expt 10 half-n) middle-coeff)                                      
                    bd))))))))                                                             
                                                                                           
                                                                                           
                                                                                           
  (karatsuba-mult 420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420420
                  696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969)

