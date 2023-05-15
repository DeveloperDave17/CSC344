#lang racket
( require 2htdp/image )

( define ( cs radius )
   ( * radius 2 )
)

( define ( cc side )
   ( * ( / side 2 ) ( sqrt 2 ) )
)

( define ( ic side )
   ( / side 2 )
)

( define ( is radius )
   ( * ( / radius ( sqrt 2 ) ) 2 )
)

( define ( cs-demo radius )
   ( define c ( circle radius 'solid 'blue ) )
   ( define s ( square ( cs radius ) 'solid 'purple ) )
   ( overlay c s )
)

( define ( cc-demo side )
   ( define s ( square side 'solid 'blue ) )
   ( define c ( circle ( cc side ) 'solid 'purple ) )
   ( overlay s c )
)

( define ( ic-demo side )
   ( define s ( square side 'solid 'blue ) )
   ( define c ( circle ( ic side ) 'solid 'purple ) )
   ( overlay c s )
)

( define ( is-demo radius )
   ( define c ( circle radius 'solid 'blue ) )
   ( define s ( square ( is radius ) 'solid 'purple ) )
   ( overlay s c )
)

( define ( image-1  side )
   ( define outer-s ( square side 'solid 'purple ) )
   ( define outer-radius ( ic side ) )
   ( define outer-c ( circle outer-radius 'solid 'cyan ) )
   ( define inner-side ( is outer-radius ) )
   ( define inner-s ( square inner-side 'solid 'purple ) )
   ( define inner-s-rotated ( rotate 45 inner-s ) )
   ( define inner-c ( circle ( ic inner-side ) 'solid 'cyan ) )
   ( define inner-shape ( overlay inner-c inner-s-rotated ) )
   ( define outer-shape ( overlay outer-c outer-s ) )
   ( overlay inner-shape outer-shape )
)

( define ( image-2 side )
   ( define outer-s ( square side 'outline 'red ) )
   ( define side-outer-rotated ( is (/ side 2 ) ) )
   ( define rotated-outer-s ( rotate 45 ( square side-outer-rotated 'outline 'red ) ) )
   ( define inner-side ( is (/ side-outer-rotated 2) ) )
   ( define inner-s ( square inner-side 'outline 'red ) )
   ( define side-inner-rotated ( is (/ inner-side 2 ) ) )
   ( define rotated-inner-s ( rotate 45 ( square side-inner-rotated 'outline 'red ) ) )
   ( define inner ( overlay rotated-inner-s inner-s ) )
   ( define outer ( overlay rotated-outer-s outer-s ) )
   ( overlay inner outer )
)

( define (warholesque-image outer-side )
   ( define ( image-part  side )
      ( define ( rgb ) ( random 0 256 ) )
      ( define color-1 ( color ( rgb ) ( rgb ) ( rgb ) ) )
      ( define color-2 ( color ( rgb ) ( rgb ) ( rgb ) ) )
      ( define outer-s ( square side 'solid color-1 ) )
      ( define outer-radius ( ic side ) )
      ( define outer-c ( circle outer-radius 'solid color-2 ) )
      ( define inner-side ( is outer-radius ) )
      ( define inner-s ( square inner-side 'solid color-1 ) )
      ( define inner-s-rotated ( rotate 45 inner-s ) )
      ( define inner-c ( circle ( ic inner-side ) 'solid color-2 ) )
      ( define inner-shape ( overlay inner-c inner-s-rotated ) )
      ( define outer-shape ( overlay outer-c outer-s ) )
      ( overlay inner-shape outer-shape )
   )
   ( define outer-horz-rect ( rectangle (- (/ outer-side 2) 6) 4 'solid 'black ) )
   ( define inner-horz-rect ( rectangle (- (/ outer-side 2) 6) 2 'solid 'black ) )
   ( define outer-vert-rect ( rectangle 4 (/ outer-side 2 ) 'solid 'black ) )
   ( define inner-vert-rect ( rectangle 2 (/ outer-side 2 ) 'solid 'black ) )
   ( define inner-side ( - ( / outer-side 2) 6 ) )
   ( define top-left ( image-part inner-side) )
   ( define top-left-with-border ( beside outer-vert-rect ( beside ( above outer-horz-rect ( above top-left inner-horz-rect ) ) inner-vert-rect ) ) )
   ( define bottom-left ( image-part inner-side) )
   ( define bottom-left-with-border ( beside outer-vert-rect ( beside ( above inner-horz-rect ( above bottom-left outer-horz-rect ) ) inner-vert-rect ) ) )
   ( define top-right ( image-part inner-side) )
   ( define top-right-with-border ( beside inner-vert-rect ( beside ( above outer-horz-rect ( above top-right inner-horz-rect ) ) outer-vert-rect ) ) )
   ( define bottom-right ( image-part inner-side) )
   ( define bottom-right-with-border ( beside inner-vert-rect ( beside ( above inner-horz-rect ( above bottom-right outer-horz-rect ) ) outer-vert-rect ) ) )
   ( define left-side ( above top-left-with-border bottom-left-with-border ) )
   ( define right-side ( above top-right-with-border bottom-right-with-border ) )
   ( beside left-side right-side ) 
)
