ready = ->
  Typed.new '.element',
    strings: ['Hi my name is Luke Skywalker', 'I grew up on the planet of Tatooine'],
    typeSpeed: 0
    backDelay: 1500,
    loop: !0, 
    startDelay: 1000,
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
