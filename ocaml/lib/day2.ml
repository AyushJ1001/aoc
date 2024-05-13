open Core

type set =
  { red : int
  ; green : int
  ; blue : int
  }

type game =
  { id : int
  ; sets : set list
  }

let create_game game =
  let turns = String.split game ~on:',' in


let get_game line =
  let (id :: sets :: _) = String.split line ~on:':' in
  let id = String.sub id ~pos:5 ~len:(String.length id - 1) in
  let id = int_of_string id in
  let sets = String.split sets ~on:';' in
  
  id
;;

let part1 () =
  let input = In_channel.read_lines "inputs/day2/test1" in
  List.iter input ~f:print_endline
;;
