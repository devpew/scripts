#!/bin/bash
ffmpeg -i $1 -r 3 -s 587x550 $1.gif
