#!/usr/bin/env bash

#org_image_dir=/home/hlc/Data/rock/Synchrotron/6.5_L5_048_20MPa_99MPa_pag-0.36_3.41_/segment/sub_mask_cov_v9_damage

#org_image_dir=/home/hlc/Data/rock/Synchrotron/6.5_L5_003_10MPa_17MPa_pag-0.36_3.41_/segment/seg
org_image_dir=/home/hlc/Data/rock/Synchrotron/layer38_41_scan047_059_seg_change_images

work_dir=/home/hlc/codes/PycharmProjects/yghlc_marchingcube/MarchingCubes/test_rock

cd ${work_dir}

start_slice=0
end_slice=900

rm -r CT
mkdir CT

#for idx in $(seq -f "%03g" ${start_slice} ${end_slice});
#do
#    echo $idx
#    # damage voxels
##    gdal_translate -of ENVI ${org_image_dir}/*0${idx}_sub_mask_cov_damage.jpg CT/${idx}.dat
#
#    # pore voxels
#    gdal_translate -of ENVI ${org_image_dir}/*0${idx}_sub_mask_seg.tif CT/${idx}.dat
#
#done

start_slice=190
end_slice=230
for idx in $(seq -f "%03g" ${start_slice} ${end_slice});
do
    echo $idx
    # damage voxels
#    gdal_translate -of ENVI ${org_image_dir}/*0${idx}_sub_mask_cov_damage.jpg CT/${idx}.dat

    # pore voxels
    gdal_translate -of ENVI ${org_image_dir}/Layer_38_41_scan_047_059_1${idx}_changes_code.tif CT/${idx}.dat

done


../marchingCubes