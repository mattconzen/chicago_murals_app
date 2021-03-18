class ProjectOneApp < Sinatra::Base
  get '/' do
    erb :"blog/new"
  end

  get '/blogs/:id' do
    @blog = Blog.find(params[:id])
    erb :"blog/show"
  end

  get '/blogs' do
    @blogs = Blog.all
    erb :"blogs/show"
  end

  post '/' do
    blog = Blog.new(params["blog"])
    if blog.save
      redirect "/blogs/#{blog.id}"
    else
      erb :"blog/new"
    end
  end
end