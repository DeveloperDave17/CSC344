#lang racket

;---------------
; LEL sentence generator, with helper PICK,
; several applications of APPEND, several
; applications of LIST, and one use of MAP
; with a LAMBDA function.

( define ( pick list )
   ( list-ref list ( random ( length list ) ) )
)

( define ( noun )
   ( list ( pick '( robot baby toddler hat dog ) ) )
)

( define ( verb )
   ( list ( pick '( kissed hugged protected chased hornswoggled ) ) )
)

( define ( article )
   ( list ( pick '(a the ) ) )
)

( define ( qualifier )
   ( pick '( ( howling ) ( talking ) ( dancing )
             ( barking ) ( happy ) ( laughing )
             () () () () () ()
           )
   )
)

( define ( noun-phrase )
   ( append ( article ) ( qualifier ) ( noun ) )
)

( define ( sentence )
   ( append ( noun-phrase ) ( verb ) ( noun-phrase ) )
)

( define ( ds ) ; display a sentence
   ( map
     ( lambda ( w ) ( display w ) ( display " " ) )
     ( sentence )
   )
   ( display "" ) ; an artificial something
)