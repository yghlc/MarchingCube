#!/usr/bin/env bash

#org_image_dir=/home/hlc/Data/rock/Synchrotron/6.5_L5_048_20MPa_99MPa_pag-0.36_3.41_/segment/sub_mask_cov_v9_damage

#org_image_dir=/home/hlc/Data/rock/Synchrotron/6.5_L5_003_10MPa_17MPa_pag-0.36_3.41_/segment/seg

folder_scan20=~/Data/rock/Synchrotron/6.5_L5_020_20MPa_59MPa_pag-0.36_3.41_/segment
folder_scan40=/home/hlc/Data/rock/Synchrotron/6.5_L5_040_20MPa_89MPa_pag-0.36_3.41_/segment
folder_scan60=/home/hlc/Data/rock/Synchrotron/6.5_L5_060_20MPa_116MPa_pag-0.36_3.41_/segment


#org_image_dir=/home/hlc/Data/rock/Synchrotron/layer38_41_scan047_059_seg_change_images
org_image_dir=${folder_scan20}

work_dir=/home/hlc/codes/PycharmProjects/yghlc_marchingcube/MarchingCubes/test_rock

cd ${work_dir}


#scan20
start_slice=0
#end_slice=600
end_slice=1599

#
rm -r CT
mkdir CT

for idx in $(seq -f "%04g" ${start_slice} ${end_slice});
do
    echo $idx

    # porosity

    # scan 20
    gdal_translate -of ENVI ${org_image_dir}/*${idx}_sub_mask_seg.tif CT/${idx}.dat

done


../marchingCubes