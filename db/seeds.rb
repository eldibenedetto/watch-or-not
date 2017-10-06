require 'rest-client'
require 'json'
require 'pry'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Note.create([
#   { body: 'The frontend (Vanilla JS) and backend (Rails API) will reside in two separate repos'},
#   { body: 'Install and configure Postgresql <a target="_blank" href="https://postgresapp.com/">Postgresapp</a>.' },
#   { body: 'Remember to use "--database=postgresql" when generating your Rails application to use Postgresql vs SqlLite.' },
#   { body: 'Create your Rails application as an <a target="_blank" href="http://guides.rubyonrails.org/api_app.html">API</a>.' },
#   { body: 'Add support for <a target="_blank" href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS">cross-origin resource sharing</a>, using <a target="_blank" href=" https://github.com/cyu/rack-cors">rack-cors</a>. See this <a target="_blank" href="https://github.com/learn-co-curriculum/js-project-week-setup/commit/8272dbfcde33503adbb22bb0dbc731233527fad6">commit</a> as a reference.' },
#   { body: 'Design your data model and define the structure of your JSON data.' },
#   { body: 'Remember to namespace your <a target="_blank" href="http://guides.rubyonrails.org/routing.html#controller-namespaces-and-routing">routes and controllers</a>.' },
#   { body: 'Learn <a href="https://chriskottom.com/blog/2017/04/versioning-a-rails-api"/>why</a> version an API'},
#   { body: 'When lost take a walk, then befriend <a target="_blank" href="https://developer.mozilla.org/en-US/">MDN</a> and <a target="_blank" href="http://api.rubyonrails.org/">api.rubyonrails.org</a>.' }
#   ])

# loop through array of ids every 30 sec
# allIDs.each do |id|
#  response = api.get (url + id)
#  response.save
#  system_wait(.5sec)
# end
 
all_ids = "341013, 301334, 379149, 406994, 381289, 398175, 394117, 395834, 283591, 401898, 420622, 400710, 399170, 298250, 337703, 407445, 290512, 378111, 372343, 274862, 378064, 293670, 399031, 392982, 274855, 398924, 423087, 354859, 451955, 421131, 407445, 290512,
  378111, 372343, 274862, 378064, 293670, 336000, 444176, 399790, 369192, 399031, 392982, 274855, 398924, 437081, 455819, 423087, 354859, 398181, 432087, 300687, 415401, 339877, 271404, 474954, 429200, 478587, 432627, 397538, 476791, 433808, 451499, 471968, 322525,
  476631, 402897, 467915, 451679, 432618, 476165, 467010, 429199, 462883, 459698, 476040, 448755, 410117, 434175, 458905, 399057, 370663, 469544, 461311, 407448, 407440, 460585, 419439, 466415, 335777, 479016 ,  478826 ,  428495 ,  454699 ,  477666 ,  476781 ,  
  411764 ,  429191 ,  474596 ,  474716 ,  421386 ,  478044 ,  476600 ,  461448 ,  438348 ,  476486 ,  456287 ,  473262 ,  437670 ,  283984 ,  335788 ,  425980 ,  396810 ,  432087 ,  300687 ,  415401 ,  477623 ,  339877 ,  271404 ,  354912 ,  474954 ,  
 429200 ,  445793 ,  478662 ,  478659 ,  478673 ,  478674 ,  478676 ,  478778 ,  478587 ,  398818 ,  432627 ,  429174 ,  466614 ,  397538 ,  354285 ,  476791 ,  433808 ,  451499 ,  471968 ,  322525 ,  476631 ,  402897 ,  467915 ,  451679 ,  432618 ,
   425298 ,  401246 ,  448449 ,  478782 ,  478776 ,  403899 ,  476919 ,  444397 ,  413686 ,  478588 ,  401252 ,  455605 ,  478160 ,  345923 ,  465010 ,  479016 ,  478826 ,  428495 ,  454699 ,  477666 ,  476781 ,  411764 ,  429191 ,  474596 ,  474716 ,  
  421386 ,  478044 ,  476600 ,  461448 ,  438348 ,  476486 ,  473309 ,  456287 ,  473262 ,  437670 ,  283984 ,  467425 ,  469310 ,  478592 ,  399366 ,  376540 ,  434245 ,  471500 ,  477269, 463743 , 475756 , 432799 , 454549 , 477266 , 474615 ,
  477272 , 381081 , 347629 , 467173 , 475149 , 461777 , 472123 , 439154 , 463593 , 477274 , 479266 , 428493 , 477271 , 422708 , 476197 , 408616 , 467980 , 477275 , 476131 , 412210 , 364691 , 428399 , 374331 , 432605 , 451353 ,
  393544 , 434143 , 464832 , 478180 , 450314 , 434505 , 415010 , 463022 , 461013 , 472152 , 472310 , 441188 , 477270 , 474718 , 471970 , 462103 , 477397 , 468436 , 391596 , 442056 , 479192 , 460591 , 477273 , 472893 , 433945 ,
  436343 , 473554 , 460062 , 473392 , 428399 , 374331 , 432605 , 451353 , 393544 , 434143 , 464832 , 454823 , 478180 , 450314 , 434505 , 415010 , 403847 , 463022 , 461013 , 436835 , 467911 , 479354 , 465242 , 442314 , 454826 , 439979 , 428584 , 376391 , 403308 , 466216 , 470831 , 467581 , 464586 , 471779 , 467998 , 476197 , 408616 , 477275 , 476131 , 412210 , 467253 , 364691".split(",").map {|element| element.squish.to_i}

all_ids.each do |id|
  url = "https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV["tmdb_api_key"]}&append_to_response=videos"
  response = RestClient.get(url)
  parsed_response = JSON.parse(response)
  if parsed_response["videos"]["results"][0]
    Movie.find_or_create_by(title: parsed_response["original_title"], youtube_key: parsed_response["videos"]["results"][0]["key"], raw_JSON: response.to_s)
  end
  sleep(0.5)
end
