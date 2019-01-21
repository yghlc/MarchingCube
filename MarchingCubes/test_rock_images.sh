#!/usr/bin/env bash

#org_image_dir=/home/hlc/Data/rock/Synchrotron/6.5_L5_048_20MPa_99MPa_pag-0.36_3.41_/segment/sub_mask_cov_v9_damage

#org_image_dir=/home/hlc/Data/rock/Synchrotron/6.5_L5_003_10MPa_17MPa_pag-0.36_3.41_/segment/seg

folder_cb3='/home/hlc/Data/rock/Synchrotron/layer38_41_scan047_059_seg_change_images'
folder_cb2='/home/hlc/Data/rock/Synchrotron/layer51_54_scan047_057_seg_change_images'
folder_cb1='/home/hlc/Data/rock/Synchrotron/layer67_72_scan047_056_seg_change_images'

# add CB1' and CB2' on 21 Jan 2019
folder_cb1P='/home/hlc/Data/rock/Synchrotron/layer60_62_scan047_056_seg_change_images'
folder_cb2P='/home/hlc/Data/rock/Synchrotron/layer46_47_scan047_054_seg_change_images'

#echo $folder_cb1

#org_image_dir=/home/hlc/Data/rock/Synchrotron/layer38_41_scan047_059_seg_change_images
org_image_dir=${folder_cb2P}

work_dir=/home/hlc/codes/PycharmProjects/yghlc_marchingcube/MarchingCubes/test_rock

cd ${work_dir}


rm -r CT
mkdir CT


#cb1
#start_slice=880
#end_slice=940

#cb2
#start_slice=61
#end_slice=100

#cb 3
#start_slice=190
#end_slice=230

#cb1 prime
#start_slice=980
#end_slice=1010

#cb2 prime
start_slice=1130
end_slice=1150

#for idx in $(seq -f "%03g" ${start_slice} ${end_slice});
#do
#    echo $idx
    # damage voxels
#    gdal_translate -of ENVI ${org_image_dir}/*0${idx}_sub_mask_cov_damage.jpg CT/${idx}.dat

    # pore voxels
    #cb 3
#    gdal_translate -of ENVI ${org_image_dir}/Layer_38_41_scan_047_059_1${idx}_changes_code.tif CT/${idx}.dat

#    # cb 1
#    gdal_translate -of ENVI ${org_image_dir}/Layer_67_72_scan_047_056_0${idx}_changes_code.tif CT/${idx}.dat

     #cb 2
#    gdal_translate -of ENVI ${org_image_dir}/Layer_51_54_scan_047_057_1${idx}_changes_code.tif CT/${idx}.dat

#done
var=0
for idx in $(seq -f "%04g" ${start_slice} ${end_slice});do
    echo $idx $var
    gdal_translate -of ENVI ${org_image_dir}/Layer_*_scan_*_${idx}_changes_code.tif CT/${idx}.dat
    let "var=var+1"
done

echo 150 150 0.23 0.1 0.23 $start_slice $end_slice
../marchingCubes 
