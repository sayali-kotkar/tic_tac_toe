# TicTacToe

 This is the implementation of famous tic tac toe game.

## Main Technology stack

* Elixir

* Phoenix

## Getting up and running:

* Git clone https://github.com/sayali-kotkar/tic_tac_toe

* In a command line, run `mix deps.get` in order to install all required dependencies.

* Run `mix phoenix.server` to start the game engine.  Application will now be up and running.

## Summary

This application  provides you with two endpoints

 1. Start Endpoint - POST http://localhost:4000/game

  This endpoint creates a unique id for the game and creates a empty board to play the game.

   Response
   ```
      {
        "board": {
        "Cell(1, 1)": "empty",
        "Cell(2, 1)": "empty",
        "Cell(3, 1)": "empty",
        "Cell(1, 2)": "empty",
        "Cell(2, 2)": "empty",
        "Cell(3, 2)": "empty",
        "Cell(1, 3)": "empty",
        "Cell(2, 3)": "empty",
        "Cell(3, 3)": "empty"
        },
        "game_id": 29,
        "msg": "success"
    }
   ```

  2. Endpoint to make a move - PUT http://localhost:4000/game/{game_id}

   This endpoint is used by a user to make a move on the board

   Request:
   ```
     {
        "player_id": 0,  //this can be 0 or X
        "row": 1,
        "column": 1    
     }
   ```
    Response:

    ```
      {
        "board": {
        "Cell(1, 1)": 0,
        "Cell(2, 1)": "empty",
        "Cell(3, 1)": "empty",
        "Cell(1, 2)": "empty",
        "Cell(2, 2)": "empty",
        "Cell(3, 2)": "empty",
        "Cell(1, 3)": "empty",
        "Cell(2, 3)": "empty",
        "Cell(3, 3)": "empty"
        }
        "msg": "success",
        "game_id": "71"
      }

    ```
## Tests
 you can run tests with following command
 
 mix test test/tictactoe/tictactoetest.exs
 
## References
1. https://medium.com/skyhub-labs/elixir-for-java-developers-episode-i-66b65c862652 
2. https://www.youtube.com/watch?v=G3JRv2dHU9A&feature=emb_rel_pause
3. https://joyofelixir.com/toc.html 
4. https://bram209.github.io/2017-08-30-tic-tac-toe-in-phoenix-vue-js/ 
5. https://github.com/javflores/tic-tac-toe/blob/master/game_engine/README.md
