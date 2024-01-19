#!/bin/bash

size=256
temp="./intermediate.png"

for file in ./svg/* ; do
    input=${file}
    output="${file//svg/png}"
    echo "${input} -> ${output}"

    rsvg-convert -w ${size} -h ${size} ${input} -o ${temp}
    convert ${temp} -channel RGB -negate ${output}
done

rm -f ${temp}

