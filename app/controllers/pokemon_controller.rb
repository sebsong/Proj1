class PokemonController < ApplicationController
    def capture
        captured_pokemon = Pokemon.find(params[:id])
        captured_pokemon.trainer_id = current_trainer.id
        captured_pokemon.save!
        redirect_to root_path
    end

    def damage
        trainer_id = params[:trainer_id]
        damaged_pokemon = Pokemon.find(params[:id])
        damaged_pokemon.health -= 10
        damaged_pokemon.save!
        if damaged_pokemon.health <= 0
            damaged_pokemon.destroy
        end
        redirect_to trainer_path(trainer_id)
    end
end
