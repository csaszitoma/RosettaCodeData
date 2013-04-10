(define (write-ppm image file)
  (define (write-image image)
    (define (write-row row)
      (define (write-colour colour)
        (if (not (null? colour))
            (begin (write-char (integer->char (car colour)))
                   (write-colour (cdr colour)))))
      (if (not (null? row))
          (begin (write-colour (car row)) (write-row (cdr row)))))
    (if (not (null? image))
        (begin (write-row (car image)) (write-image (cdr image)))))
  (with-output-to-file file
    (lambda ()
      (begin (display "P6")
             (newline)
             (display (length (car image)))
             (display " ")
             (display (length image))
             (newline)
             (display 255)
             (newline)
             (write-image image)))))