-module(prime).
-export([is_prime/1, main/0]).

is_prime(N) when N =< 1 ->
    false;
is_prime(N) ->
    is_prime_helper(N, 2, round(math:sqrt(N))).

is_prime_helper(_, I, End) when I > End ->
    true;
is_prime_helper(N, I, End) ->
    case N rem I of
        0 -> false;
        _ -> is_prime_helper(N, I + 1, End)
    end.

main() ->
    Start = erlang:system_time(millisecond),
    C = count_primes(0, 9000000, 0),
    io:format("~p~n", [C]),
    End = erlang:system_time(millisecond),
    io:format("~pms~n", [End - Start]).

count_primes(I, Max, C) when I < Max ->
    case is_prime(I) of
        true -> count_primes(I + 1, Max, C + 1);
        false -> count_primes(I + 1, Max, C)
    end;
count_primes(_, _, C) ->
    C.
