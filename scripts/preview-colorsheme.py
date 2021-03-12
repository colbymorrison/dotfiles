#! /bin/python

import sys 
import json

def hex_to_rbg(hex):
  ret = []

  for i in range(1,7,2):
      ret.append(int(hex[i: i+2], 16))

  return ret


def main():
    # When called from theme CLI
    scheme_name = sys.argv[1].split()[1]

    # When called from command line
    if scheme_name is None:
        scheme_name = sys.argv[1]

    fle=f"/usr/lib/python{sys.version_info[0]}.{sys.version_info[1]}/site-packages/pywal/colorschemes/dark/{scheme_name}.json"
    
    with open(fle) as f:
        contents = json.load(f)
    
    for i, color in enumerate(contents.get("colors").values()):
        hx = hex_to_rbg(color)
        # block is U+2588
        print(f"\033[38;2;{hx[0]};{hx[1]};{hx[2]}m███  ", end="")

        if(i == 7 or i == 15):
            print()

if __name__ == "__main__":
    main()
