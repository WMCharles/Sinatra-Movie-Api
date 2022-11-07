class ApplicationController < Sinatra::Base

    set :bind, '0.0.0.0'

    configure do
        enable :cross_origin
    end
    
    before do
        response.headers['Access-Control-Allow-Origin'] = '*'
    end
    
    # routes...
    options "*" do
        response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
        response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
        response.headers["Access-Control-Allow-Origin"] = "*"
        200
    end

    get '/movies' do 
        movies = Movie.all

        movies.to_json
    end

    get '/movies/:id' do 
        movie = Movie.find(params[:id])

        movie.to_json
    end

    post '/movies' do 
        movie = Movie.create(
            title: params[:title],
            release_year: params[:release_year]
        )
        movie.to_json
    end

    patch '/movies/:id' do
        movie = Movie.find(params[:id])

        movie.update(
            title: params[:title],
            release_year: params[:release_year]
        )
        movie.to_json
    end
    
    delete '/movies/:id' do
        movie = Movie.find(params[:id])

        movie.destroy

        movie.to_json
    end
end