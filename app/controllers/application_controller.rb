class ApplicationController < Sinatra::Base 

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
    
end