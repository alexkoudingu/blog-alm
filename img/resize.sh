#!/bin/bash
REMAKE=FALSE
REMOVE=TRUE

MAX_WIDTH=1920
SMALL_WIDTH=500

#if 2argument do
if [[ $1 =~ ^.*/([0-9]{4})/([0-9]{2})/.*$ ]]; then
    folder=$1
    year=${BASH_REMATCH[1]}
    month=${BASH_REMATCH[2]}
else
    echo "param 1 is folder \n"
    echo "param 2 is day of the article \n"
fi

if [[ $2 =~ ^[0-9]+$ ]]; then
    dayArticle=$2
else
    echo "param 1 is folder \n"
    echo "param 2 is day of the article \n"
fi

imagelist=`find $folder -maxdepth 1 -regex '^.*\.jpg$' -type f -printf "%f\n"`
#echo $imagelist
for sourceimage in $imagelist; do
    filename2process="${sourceimage}"

    if ! [[ $filename2process =~ ^.*[0-9]{4}-[0-9]{2}-[0-9]{2}_.*\.jpg$ ]];then
        echo $filename2process" don't match naming"
        contentName=${filename2process%".jpg"}
        newname=$year"-"$month"-"$dayArticle"_"$contentName"_full.jpg"
        mv $folder$filename2process $folder$newname
        echo $filename2process" was renamed "$newname
        filename2process="${newname}"
    fi

    if [[ $filename2process =~ ^.*[0-9]{4}-[0-9]{2}-${dayArticle}_.*_${MAX_WIDTH}\.jpg$ ]];then
        contentName=${filename2process%"_${MAX_WIDTH}.jpg"}
        nameSmallWidth=$contentName"_"$SMALL_WIDTH".jpg"
        if (! [ -f $folder$nameSmallWidth ]) || ([ $REMAKE == TRUE ]);then
            convert $folder$filename2process -resize 500 $folder$nameSmallWidth
            echo $nameSmallWidth" was generated"
        fi
    elif [[ $filename2process =~ ^.*[0-9]{4}-[0-9]{2}-${dayArticle}_.*_full\.jpg$ ]];then
        contentName=${filename2process%"_full.jpg"}

        nameSmallWidth=$contentName"_"$SMALL_WIDTH".jpg"
        if (! [ -f $folder$nameSmallWidth ]) || ([ $REMAKE == TRUE ]);then
            convert $folder$filename2process -resize 500 $folder$nameSmallWidth
            echo $nameSmallWidth" was generated"
        fi

        nameMaxWidth=$contentName"_"$MAX_WIDTH".jpg"
        if (! [ -f $folder$nameMaxWidth ]) || ([ $REMAKE == TRUE ]);then
            convert $folder$filename2process -resize 1920 $folder$nameMaxWidth
            echo $nameMaxWidth" was generated"
        fi

        if [ $REMOVE == TRUE ];then
            rm $folder$filename2process
            echo $filename2process" was removed"
        fi
    fi
   #  convert $folder$sourceimage -resize 1920 $folder$nameMaxWidth
   #  convert $folder$sourceimage -resize 500 $folder$nameSmallWidth
done

echo "script has finished"


    