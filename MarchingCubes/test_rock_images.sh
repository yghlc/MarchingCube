#!/usr/bin/env bash

org_image_dir=/home/hlc/Data/rock/Synchrotron/6.5_L5_048_20MPa_99MPa_pag-0.36_3.41_/segment/sub_mask_cov_v9_damage

work_dir=/home/hlc/codes/PycharmProjects/yghlc_marchingcube/MarchingCubes/test_rock

cd ${work_dir}

start_slice=0
end_slice=900

mkdir CT

#for idx in $(seq -f "%03g" ${start_slice} ${end_slice});
#do
#    echo $idx
#    gdal_translate -of ENVI ${org_image_dir}/*0${idx}_sub_mask_cov_damage.jpg CT/${idx}.dat
#
#done

../marchingCubes