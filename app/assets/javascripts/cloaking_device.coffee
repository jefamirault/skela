root = exports ? this

root.cloak = (selector) ->
  $(selector).addClass 'invisible'
root.decloak = (selector) ->
  $(selector).removeClass 'invisible'
root.toggleCloak = (selector) ->
  $(selector).toggleClass 'invisible'

root.phase = (selector) ->
  $(selector).addClass 'phased'
root.dephase = (selector) ->
  $(selector).removeClass 'phased'
root.togglePhase = (selector) ->
  $(selector).toggleClass 'phased'
root.delayPhase = (selector) ->
  doPhase = ->
    phase selector
  window.setTimeout doPhase, 300

root.phaseCloak = (selector) ->
  cloak selector
  delayPhase selector
root.dephaseCloak = (selector) ->
  dephase selector
  decloak selector
root.togglePhaseCloak = (selector) ->
  if $(selector).hasClass 'phased'
    dephaseCloak selector
  else
    phaseCloak selector

