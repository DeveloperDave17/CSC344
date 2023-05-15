#lang racket

( require 2htdp/image )

( define ( tile background-color c1-color c2-color c3-color )
   ( define tile-background ( square 100 'solid background-color ) )
   ( define c1 ( circle 45 'solid c1-color ) )
   ( define c2 ( circle 30 'solid c2-color ) )
   ( define c3 ( circle 15 'solid c3-color ) )
   ( overlay c3 c2 c1 tile-background )
)

( define ( dots-permutations color1 color2 color3 )
   ( define dot1 ( tile 'white color1 color2 color3 ) )
   ( define dot2 ( tile 'white color1 color3 color2 ) )
   ( define dot3 ( tile 'white color2 color1 color3 ) )
   ( define dot4 ( tile 'white color2 color3 color1 ) )
   ( define dot5 ( tile 'white color3 color1 color2 ) )
   ( define dot6 ( tile 'white color3 color2 color1 ) )
   ( beside dot1 dot2 dot3 dot4 dot5 dot6 )
)

