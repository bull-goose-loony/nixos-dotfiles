{
  config,
  pkgs,
  ...
}: {
  # Homerow Mods with Kmonad!
  services.kmonad = {
    enable = true;
    keyboards.main = {
      device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
      config = ''
        (defcfg
          input  (device-file "/dev/input/by-path/platform-i8042-serio-0-event-kbd")
          output (uinput-sink "kmonad")
          fallthrough true
        )

        (defalias
          home_a   (tap-hold-next-release 250 a         lmeta)
          home_s   (tap-hold-next-release 250 s         lalt)
          home_d   (tap-hold-next-release 250 d         lshift)
          home_f   (tap-hold-next-release 250 f         lctrl)
          home_j   (tap-hold-next-release 250 j         rctrl)
          home_k   (tap-hold-next-release 250 k         rshift)
          home_l   (tap-hold-next-release 250 l         ralt)
          home_sc  (tap-hold-next-release 250 semicolon rmeta)

          caps_esc esc
        )

        (defsrc
          q w e r t y u i o p
          caps a s d f g h j k l semicolon
          z x c v b n m

        )

        (deflayer base
          q w e r t y u i o p
          @caps_esc @home_a @home_s @home_d @home_f g h j k l @home_sc
          z x c v b n m

        )

      '';
    };
  };
}
