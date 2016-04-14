require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require 'pry'
require_relative 'lib/post.rb'
require_relative 'lib/blog.rb'

set :haml, :format => :html5
enable(:sessions)

@@blog = Blog.new
@@post1 = Post.new("Post1", Time.gm(2016,04,10), "Lorem fistrum no puedor amatomaa llevame al sircoo ese pedazo de ese hombree pecador. Quietooor llevame al sircoo caballo blanco caballo negroorl quietooor diodenoo a wan. No te digo trigo por no llamarte Rodrigor apetecan de la pradera por la gloria de mi madre está la cosa muy malar se calle ustée. Ahorarr va usté muy cargadoo amatomaa llevame al sircoo caballo blanco caballo negroorl va usté muy cargadoo pecador ese hombree apetecan de la pradera te va a hasé pupitaa. Se calle ustée torpedo de la pradera hasta luego Lucas se calle ustée quietooor benemeritaar por la gloria de mi madre. Apetecan la caidita está la cosa muy malar te voy a borrar el cerito de la pradera mamaar torpedo quietooor.", "Category 1", "Urtzi")
@@post2 = Post.new("Post2", Time.gm(2016,04,11), "Lorem fistrum sexuarl a wan está la cosa muy malar. Jarl ese pedazo de ese que llega por la gloria de mi madre. Me cago en tus muelas te voy a borrar el cerito sexuarl a wan la caidita te va a hasé pupitaa caballo blanco caballo negroorl apetecan. No te digo trigo por no llamarte Rodrigor jarl tiene musho peligro condemor jarl al ataquerl condemor. Sexuarl amatomaa papaar papaar torpedo mamaar torpedo benemeritaar diodeno está la cosa muy malar caballo blanco caballo negroorl quietooor. Llevame al sircoo ese que llega mamaar por la gloria de mi madre pecador. Al ataquerl la caidita condemor de la pradera benemeritaar. Se calle ustée hasta luego Lucas va usté muy cargadoo tiene musho peligro pupita al ataquerl ese que llega diodeno.", "Category 2", "Urtzi")
@@post3 = Post.new("Post3", Time.gm(2016,04,12), "Lorem fistrum mamaar caballo blanco caballo negroorl a gramenawer torpedo amatomaa. Diodeno apetecan pecador la caidita ahorarr pupita no puedor ese que llega la caidita. Diodeno por la gloria de mi madre de la pradera mamaar. Qué dise usteer llevame al sircoo por la gloria de mi madre se calle ustée no te digo trigo por no llamarte Rodrigor diodeno papaar papaar jarl a peich condemor. De la pradera por la gloria de mi madre apetecan condemor tiene musho peligro a peich no te digo trigo por no llamarte Rodrigor qué dise usteer fistro.", "Category 1", "Urtzi")
@@post4 = Post.new("Post4", Time.gm(2016,04,13), "Lorem fistrum por la gloria de mi madre al ataquerl se calle ustée de la pradera al ataquerl amatomaa por la gloria de mi madre. Pupita llevame al sircoo va usté muy cargadoo te voy a borrar el cerito ese hombree hasta luego Lucas fistro hasta luego Lucas a wan. Se calle ustée te va a hasé pupitaa de la pradera hasta luego Lucas hasta luego Lucas te va a hasé pupitaa se calle ustée caballo blanco caballo negroorl papaar papaar torpedo jarl. Te va a hasé pupitaa pecador pecador ese que llega me cago en tus muelas ese que llega diodeno. Ese hombree pupita sexuarl condemor a peich ese hombree. De la pradera no te digo trigo por no llamarte Rodrigor diodenoo diodenoo por la gloria de mi madre ese hombree torpedo pecador benemeritaar tiene musho peligro. Qué dise usteer fistro te voy a borrar el cerito la caidita ese que llega. Qué dise usteer al ataquerl qué dise usteer diodenoo amatomaa.", "Category 1", "Other Author")
@@blog.add_post(@@post1)
@@blog.add_post(@@post2)
@@blog.add_post(@@post3)
@@blog.add_post(@@post4)
@@blog.latest_posts

get '/' do
  haml(:index)
end

get '/post/:post_id' do
  @post_id = params[:post_id].to_i
  @post = @@blog.posts.find {|post| post.id == @post_id}
  @title = @post.title
  @date = @post.date
  @text = @post.text
  @category = @post.category
  @author = @post.author
  haml(:post)
end

get '/new_post' do
  haml(:new_post)
end

post '/' do
  @title = params[:title]
  @text = params[:text]
  @author = params[:author]
  @category = params[:category]
  @date = Time.now
  if @title != "" && @text != ""
    @post = Post.new(@title, @date, @text, @category, @author)
    @@blog.add_post(@post)
    @@blog.latest_posts
  end
  haml(:index)
end
