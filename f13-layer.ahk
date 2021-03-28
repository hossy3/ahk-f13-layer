#NoEnv

; Options
TapF13ToCapsLock := False
TapF13ToEisu := False
ApplyAlphabetPrivately := False ; for MS-IME


SendMode Input
SetKeyDelay, -1

F13State := "Off" ; Off | Tapping | Pressing

F13::Return

F13 & a::Home
F13 & b::Return
F13 & c::PgDn
F13 & d::Right
F13 & e::Up
F13 & f::End
F13 & g::Delete
F13 & h::BackSpace
F13 & i::Return
F13 & j::Return
F13 & k::Left
F13 & l::Right
F13 & m::Enter
F13 & n::Return
F13 & o::Up
F13 & p::PrintScreen
F13 & q::Return
F13 & r::PgUp
F13 & s::Left
F13 & t::
    If ApplyAlphabetPrivately
        Send, +^{F10}^t^m+^{F10}{vk1D} ; NonConvert
    Else
        Send, ^t^m{vk1D} ; NonConvert
    Return
F13 & u::Return
F13 & v::
    clipboard = %clipboard%
    Send, ^v
    Return
F13 & w::Return
F13 & x::Down
F13 & y::Return
F13 & z::Escape

F13 & 1::F1
F13 & 2::F2
F13 & 3::F3
F13 & 4::F4
F13 & 5::F5
F13 & 6::F6
F13 & 7::F7
F13 & 8::F8
F13 & 9::F9
F13 & 0::F10
F13 & -::F11
F13 & =::F12

F13 & [::Return
F13 & ]::Return
F13 & \::Send %A_YYYY%-%A_MM%-%A_DD%
F13 & `;::-
F13 & '::=
F13 & ,::Down
F13 & .::Return
F13 & /::\

F13 & Tab::CapsLock
F13 & AppsKey::RAlt
F13 & vk13::Suspend ; Pause/Break

#If TapF13ToCapsLock || TapF13ToEisu
~*F13::
    If (F13State = "Off") {
        F13State := "Tapping"
        KeyWait, F13, T0.2
        If ErrorLevel
            F13State := "Pressing"
        Else If TapF13ToCapsLock
            Send {Blind}{CapsLock}
        Else If TapF13ToEisu
            Send {Blind}+{CapsLock}
        F13State := "Off"
    }
    Return
#If
