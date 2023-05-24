module mymodule
    implicit none
    private
    public :: add_numbers
contains
    subroutine add_numbers(a, b, c)
        integer, intent(in) :: a
        integer, intent(in) :: b
        integer, intent(out) :: c
        c = a + b
    end subroutine add_numbers
end module mymodule