xorg-deps:
  pkg.installed:
    - pkgs:
      - libexif12
      - xauth

chromium-browser:
  pkg.latest

warsaw:
  pkg.installed:
    - sources: 
      - warsaw: salt://base/GBPCEFwr64.deb
