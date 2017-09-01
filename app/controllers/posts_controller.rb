 class PostsController < ApplicationController
   http_basic_authenticate_with name: "Jungle", password: "Book", except: :index

   def index
     render plain: "Everyone can see me!"
   end

   def edit
     render /admin
end