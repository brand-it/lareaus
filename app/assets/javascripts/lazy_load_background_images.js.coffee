class LazyLoadBackgroundImages
  constructor: ->
    @images = []
    this.setupImages()

  setupImages: () ->
    for element in document.getElementsByClassName('lazy-load-backgrounds')
      setupImage(element)

  setupImage = (element) ->
    image = new Image()
    image.onload = -> replaceImage(this, element)
    image.src = element.dataset.backgroundSrc


  replaceImage = (image, element) ->
    element.style.backgroundImage = 'url(' + image.src + ')'

document.addEventListener "turbolinks:load", ->
  new LazyLoadBackgroundImages()