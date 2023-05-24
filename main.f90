program main
    use dependencies, only: calculate_sum
    use mymodule, only: add_numbers
    implicit none
    integer :: a, b, c, d

    a = 10
    b = 20

    call add_numbers(a, b, c)
    call calculate_sum(a, b, d)
    print*, "add = ", c
    print*, "sum = ", d
end program main
