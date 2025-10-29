{ pkgs, ... }:

{
  services.hyprsunset = {
    enable = true;
    # Attention: example config!
    settings = {
      max-gamma = 150;

      profile = [
        {
          time = "7:30";
          identity = true;
        }

        {
          time = "21:00";
          temperature = 5500;
          gamma = 0.8;
        }
      ];
    };
  };
}
