# 🎯 Number Guessing Game

Juego de adivinanza de números en **Bash + PostgreSQL**. Proyecto del currículo [Relational Database de freeCodeCamp](https://www.freecodecamp.org/).

## Cómo funciona

1. Genera un número secreto aleatorio entre 1 y 1000
2. Pide un nombre de usuario: si es nuevo lo registra, si ya jugó muestra su historial
3. El usuario adivina; el juego cuenta intentos y valida que la entrada sea un entero
4. Al acertar guarda: juegos jugados y mejor partida (menos intentos)

## Demo

```bash
$ ./number_guess.sh
Enter your username:
chaggy
Welcome back, chaggy! You have played 2 games, and your best game took 5 guesses.
Guess the secret number between 1 and 1000:
```

## Tecnologías

- Bash (variables, bucles, expresiones regulares, `psql`)
- PostgreSQL (tabla `users` con `games_played` y `best_game`)

## Base de datos

```bash
psql --username=freecodecamp --dbname=number_guess -c "\dt"
# Restaurar: psql -U postgres < database.sql
```
