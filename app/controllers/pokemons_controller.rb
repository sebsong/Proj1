class PokemonsController < ApplicationController
    def new
        @trainer = current_trainer
        @pokemon = @trainer.pokemon.build
        
    end

    def create
        @trainer = current_trainer
        @pokemon = @trainer.pokemon.build pokemon_params
        @pokemon.level = 1
        @pokemon.health = 100
        if @pokemon.save
            redirect_to trainer_path(@trainer.id)
        else
            flash[:error] = @pokemon.errors.full_messages.to_sentence
            render :action => "new"
        end
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:name)
    end
end
