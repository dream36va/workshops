{
  "image": "",
  "state": {
    "pan": {
      "x": 0,
      "y": 0
    },
    "zoom": 1
  },
  "board": "icezum",
  "graph": {
    "blocks": [
      {
        "id": "ec14aceb-aedc-48e4-8b73-269e4c98eaf6",
        "type": "basic.code",
        "data": {
          "code": "//-- Constant for the speed of automatic mode (Number of bits for the timmer)\nlocalparam SLOW = 24;    //--  1.4 secs\nlocalparam MEDIUM = 22;  //--  350 ms\nlocalparam FAST = 20;    //--  90 ms\n\n//-- Uncomment one of the options\n//localparam AUTOMATIC_MODE_SPEED = SLOW;\nlocalparam AUTOMATIC_MODE_SPEED = MEDIUM;\n//localparam AUTOMATIC_MODE_SPEED = FAST;\n\n//-- Bits of the prescaler\nparameter N = AUTOMATIC_MODE_SPEED;\n\n//-- N bits counter\nreg [N-1:0] count = 0;\n\n//-- The most significant bit is used as output\nassign o = count[N-1];\n\nalways @(posedge(clk)) begin\n  if (!ena)\n    count <= 0;\n  else\n    count <= count + 1;\nend\n\n",
          "ports": {
            "in": [
              "clk",
              "ena"
            ],
            "out": [
              "o"
            ]
          }
        },
        "position": {
          "x": 272,
          "y": 8
        }
      },
      {
        "id": "950cb4d9-a55c-4bd8-a3ba-73fcd8c7d7b9",
        "type": "basic.input",
        "data": {
          "label": "clk",
          "pin": {
            "name": "CLK",
            "value": "21"
          }
        },
        "position": {
          "x": 40,
          "y": 40
        }
      },
      {
        "id": "207edc46-ac38-40a5-8414-28898b87f991",
        "type": "basic.input",
        "data": {
          "label": "ena",
          "pin": {
            "name": "",
            "value": 0
          }
        },
        "position": {
          "x": 40,
          "y": 168
        }
      },
      {
        "id": "ae0fd9b6-c9b7-4325-b8fb-5abd21adc5f3",
        "type": "basic.output",
        "data": {
          "label": "o",
          "pin": {
            "name": "",
            "value": 0
          }
        },
        "position": {
          "x": 776,
          "y": 104
        }
      }
    ],
    "wires": [
      {
        "source": {
          "block": "950cb4d9-a55c-4bd8-a3ba-73fcd8c7d7b9",
          "port": "out"
        },
        "target": {
          "block": "ec14aceb-aedc-48e4-8b73-269e4c98eaf6",
          "port": "clk"
        }
      },
      {
        "source": {
          "block": "207edc46-ac38-40a5-8414-28898b87f991",
          "port": "out"
        },
        "target": {
          "block": "ec14aceb-aedc-48e4-8b73-269e4c98eaf6",
          "port": "ena"
        }
      },
      {
        "source": {
          "block": "ec14aceb-aedc-48e4-8b73-269e4c98eaf6",
          "port": "o"
        },
        "target": {
          "block": "ae0fd9b6-c9b7-4325-b8fb-5abd21adc5f3",
          "port": "in"
        }
      }
    ]
  },
  "deps": {}
}