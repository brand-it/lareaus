class LazyLoadImages
  constructor: ->
    @images = []
    this.setupImages()

  setupImages: () ->
    for element in document.getElementsByClassName('lazy-load-img')
      setupImage(element)

  setupImage = (element) ->
    image = new Image()
    image.onload = -> replaceImage(this, element)
    image.src = element.dataset.imageSrc

  replaceImage = (image, element) ->
    element.src = image.src

document.addEventListener "turbolinks:load", ->
  new LazyLoadImages()