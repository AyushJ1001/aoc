open Core

let char_to_int ch = int_of_char ch - int_of_char '0'

let calibrate line =
  let filtered = List.filter line ~f:Char.is_digit in
  Printf.sprintf "%c%c" (List.hd_exn filtered) (List.last_exn filtered)
;;

let part1 () =
  let content = In_channel.read_lines "inputs/day1/input" in
  let result =
    List.fold content ~init:0 ~f:(fun acc line ->
      acc + int_of_string (calibrate (String.to_list line)))
  in
  Printf.printf "%d\n" result
;;

let digits =
  [ "one", 1
  ; "two", 2
  ; "three", 3
  ; "four", 4
  ; "five", 5
  ; "six", 6
  ; "seven", 7
  ; "eight", 8
  ; "nine", 9
  ]
;;

let find_first_digit line =
  let rec aux i =
    let digit = line.[i] in
    if Char.is_digit digit
    then char_to_int digit
    else (
      let digit_name =
        List.find digits ~f:(fun (n, _) ->
          String.is_substring_at line ~pos:i ~substring:n)
      in
      match digit_name with
      | Some (_, value) -> value
      | None -> aux (i + 1))
  in
  aux 0
;;

let find_last_digit line =
  let rec aux i =
    let digit = line.[i] in
    if Char.is_digit digit
    then char_to_int digit
    else (
      let digit_name =
        List.find digits ~f:(fun (n, _) ->
          String.is_substring_at line ~pos:i ~substring:n)
      in
      match digit_name with
      | Some (_, value) -> value
      | None -> aux (i - 1))
  in
  aux (String.length line - 1)
;;

let part2 () =
  let content = In_channel.read_lines "inputs/day1/input" in
  let result =
    List.fold content ~init:0 ~f:(fun acc line ->
      let first_digit = find_first_digit line in
      let last_digit = find_last_digit line in
      let value = int_of_string (Printf.sprintf "%d%d" first_digit last_digit) in
      acc + value)
  in
  Printf.printf "%d\n" result
;;
