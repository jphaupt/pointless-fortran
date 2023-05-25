module custom_type
    implicit none
    type :: mytype
        ! TODO make real or complex based on flag
        real :: val
    end type mytype
    interface mytype
        module procedure :: mytype_init
    end interface mytype
contains

    function mytype_init(val) result(obj)
        real, intent(in) :: val
        type(mytype) :: obj
        obj%val = val
    end function mytype_init

end module custom_type
