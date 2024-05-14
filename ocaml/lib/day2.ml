open Core

type cube =
  | Red of int
  | Green of int
  | Blue of int

type set =
  { red : int
  ; green : int
  ; blue : int
  }

type game =
  { id : int
  ; sets : set list
  }

let max_list nums =
  let rec aux nums acc =
    match nums with
    | [] -> acc
    | [ x ] -> max x acc
    | h :: t -> max h (aux t acc)
  in
  aux nums Int.min_value
;;

let get_set set =
  let rounds = String.split set ~on:',' in
  let init = { red = 0; green = 0; blue = 0 } in
  let result_set =
    List.fold rounds ~init ~f:(fun acc_set round ->
      let round = String.strip round in
      let count, color =
        match String.split round ~on:' ' with
        | count :: color :: _ -> int_of_string count, color
        | _ -> failwith "invalid round"
      in
      let acc_set =
        match color with
        | "red" -> { acc_set with red = count }
        | "green" -> { acc_set with green = count }
        | "blue" -> { acc_set with blue = count }
        | _ -> failwith "invalid color"
      in
      acc_set)
  in
  result_set
;;

let get_game line =
  if String.is_empty line
  then { id = 0; sets = [] }
  else (
    let id, sets =
      match String.split line ~on:':' with
      | id :: sets :: _ -> id, sets
      | _ -> failwith (Printf.sprintf "Invalid line: `%s`" line)
    in
    let id = String.sub id ~pos:5 ~len:(String.length id - 5) in
    let id = int_of_string id in
    let sets = String.split sets ~on:';' in
    let sets = List.map sets ~f:get_set in
    { id; sets })
;;

let power game =
  let red = max_list (List.map game.sets ~f:(fun set -> set.red)) in
  let green = max_list (List.map game.sets ~f:(fun set -> set.green)) in
  let blue = max_list (List.map game.sets ~f:(fun set -> set.blue)) in
  red * green * blue
;;

let part1 () =
  let input = In_channel.read_lines "inputs/day2/input" in
  let games = List.map input ~f:get_game in
  print_endline "ids for all games: ";
  let valid_games =
    List.filter games ~f:(fun game ->
      List.for_all game.sets ~f:(fun set ->
        set.red <= 12 && set.green <= 13 && set.blue <= 14))
  in
  List.iter valid_games ~f:(fun g -> print_endline (string_of_int g.id));
  Printf.printf
    "Answer: %d\n"
    (List.fold ~init:0 valid_games ~f:(fun acc g -> acc + g.id))
;;

let part2 () =
  let input = In_channel.read_lines "inputs/day2/input" in
  let games = List.map input ~f:get_game in
  let powers = List.map games ~f:power in
  Printf.printf "Answer: %d\n" (List.fold ~init:0 powers ~f:( + ))
;;
