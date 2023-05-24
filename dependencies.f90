module dependencies
    use mymodule, only: add_numbers
    implicit none
    private
    public :: calculate_sum
contains
    subroutine calculate_sum(a, b, c)
        integer, intent(in) :: a
        integer, intent(in) :: b
        integer, intent(out) :: c
        call add_numbers(a, b, c)
    end subroutine calculate_sum
end module dependencies
