ready = ->
  Typed.new '.element',
    strings: [
      "Let's chat is a chat application developed by Keshav Biswa in Avalon Labs"
      "This app was built using Ruby on Rails 5 and Action Cable."
    ]
    typeSpeed: -100
    loop: true
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready