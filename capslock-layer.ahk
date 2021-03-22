#NoEnv

; Options
TapCapsLockToCapsLock := False
TapCapsLockToEisu := False
ApplyAlphabetPrivately := False ; for MS-IME


SendMode Input
SetKeyDelay, -1

CapsLockState := "Off" ; Off | Tapping | Pressing

CapsLock & a::Home
CapsLock & b::Return
CapsLock & c::PgDn
CapsLock & d::Right
CapsLock & e::Up
CapsLock & f::End
CapsLock & g::Delete
CapsLock & h::BackSpace
CapsLock & i::Return
CapsLock & j::Return
CapsLock & k::Left
CapsLock & l::Right
CapsLock & m::Enter
CapsLock & n::Return
CapsLock & o::Up
CapsLock & p::PrintScreen
CapsLock & q::Return
CapsLock & r::PgUp
CapsLock & s::Left
CapsLock & t::
    If ApplyAlphabetPrivately
        Send, +^{F10}^t^m+^{F10}{vk1D} ; NonConvert
    Else
        Send, ^t^m{vk1D} ; NonConvert
    Return
CapsLock & u::Return
CapsLock & v::
    clipboard = %clipboard%
    Send, ^v
    Return
CapsLock & w::Return
CapsLock & x::Down
CapsLock & y::Return
CapsLock & z::Escape

CapsLock & 1::F1
CapsLock & 2::F2
CapsLock & 3::F3
CapsLock & 4::F4
CapsLock & 5::F5
CapsLock & 6::F6
CapsLock & 7::F7
CapsLock & 8::F8
CapsLock & 9::F9
CapsLock & 0::F10
CapsLock & -::F11
CapsLock & =::F12

CapsLock & [::Return
CapsLock & ]::Return
CapsLock & \::Send %A_YYYY%-%A_MM%-%A_DD%
CapsLock & `;::-
CapsLock & '::=
CapsLock & ,::Down
CapsLock & .::Return
CapsLock & /::\

CapsLock & Tab::CapsLock
CapsLock & AppsKey::RAlt
CapsLock & vk13::Suspend ; Pause/Break

#If TapCapsLockToCapsLock || TapCapsLockToEisu
~*CapsLock::
    If (CapsLockState = "Off") {
        CapsLockState := "Tapping"
        KeyWait, CapsLock, T0.2
        If ErrorLevel
            CapsLockState := "Pressing"
        Else If TapCapsLockToCapsLock
            Send {Blind}{CapsLock}
        Else If TapCapsLockToEisu
            Send {Blind}+{CapsLock}
        CapsLockState := "Off"
    }
    Return
#If
