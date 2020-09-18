# jekyll theme & blog of my personal blog alexlemigrand.net

It was based on [Adam Blog theme](https://github.com/artemsheludko/adam-blog/). 
Some stuffs where removed (social, tracking, comment, others useless stuff -for me-)
and few other were added (img path moved, galery added, css)

## Installation & test

usually few command are enough to make it work after the git clone
```shell
bundle install
bundle exec jekyll serve
# or to relaunch when modification
jekyll server --watch --force_polling
```

## galery making

I wanted simple way to show multiple pictures, being a bit flexible, while been responsive and being abble to open them easily to watch.

### reference/inspiration
link: 
https://stackoverflow.com/questions/29036378/jekyll-dealing-with-images-in-markdown
https://christianspecht.de/2014/08/22/jekyll-lightbox2-image-gallery-another-approach/
https://jekyllcodex.org/without-plugin/lightbox/#
https://jekyllcodex.org/without-plugin/image-gallery-index/
https://jekyllcodex.org/without-plugin/image-gallery
flex container usage
div with background to be more flexible
aspect ratio with padding-top & position relative
https://luiscabrera.site/tech/2017/01/03/responsive-image-gallery-for-your-site.html

### files
only 3 files added/created :
```
_incluse/gallery.html
_assets/css/lightbox.css
_assets/js/lightbox.js
(jquery**.js -i think i already had it)
```
### usage

add the information about the galleries in the front matter of the post
```yaml
imgfolder: /img/2015/11/ #folder of all the picture (should change gallery.html if you don't want that)
galleries: 
 1: # gallery number one  
  -  # row one in gallery one
    - title: title pic1
      thumb: image_500.jpg #smallest size on page
      image: image_1920.jpg # big size when clicking on it
    - title: title pic2
      thumb: image2_500.jpg
      image: image2_500.jpg
  -  # row two in gallery one
    - title: title pic3
      thumb: image3_500.jpg
      image: image3_500.jpg
    - title: title pic4
      thumb: image4_500.jpg
      image: image4_500.jpg
 2: # gallery number two  
  -  # row one in gallery two
    - title: title pic5
      thumb: image5_500.jpg
      image: image5_500.jpg
    - title: title pic6
      thumb: image6_500.jpg
      image: image6_500.jpg
```

then call the gallery when you need them
```yaml
some paragraph of your blog...
{% include gallery.html  gallery=1 %}

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etia
{% include gallery.html  gallery=2 %}

```

### issue
when clicking/full page on a gallery, only pictures of the galery can be viewed .