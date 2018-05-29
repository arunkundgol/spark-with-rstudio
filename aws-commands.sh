aws emr create-cluster --applications Name=Hadoop Name=Spark Name=Ganglia \
--release-label emr-5.11.1 \
--name "EMR 5.11.1 RStudio + sparklyr" \
--service-role EMR_DefaultRole \
--instance-groups '[{"InstanceCount":1,"EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":25,"VolumeType":"gp2"},"VolumesPerInstance":1}],"EbsOptimized":true},"InstanceGroupType":"MASTER","InstanceType":"m4.large","Name":"Master - 1"}]' \
--bootstrap-actions '[{"Path":"s3://arunkundgol-personal/programs/aws-emr-rstudio/install-rstudio-server.sh","Name":"Custom action"}]' \
--ec2-attributes '{"KeyName":"arunkundgol","InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-3e729e45","EmrManagedSlaveSecurityGroup":"sg-6264090b","EmrManagedMasterSecurityGroup":"sg-cb660ba2"}' \
--configurations '[{"Classification":"spark","Properties":{"maximizeResourceAllocation":"true"}}]' \
--region eu-west-2

# aws emr create-cluster \
# --auto-scaling-role EMR_AutoScaling_DefaultRole \
# --applications Name=Hadoop Name=Spark \
# --bootstrap-actions '[{"Path":"s3://arunkundgol-personal/programs/aws-emr-rstudio/install-rstudio-server.sh","Name":"Custom action"}]' \
# --ebs-root-volume-size 10 \
# --ec2-attributes '{"KeyName":"arunkundgol","InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-3e729e45","EmrManagedSlaveSecurityGroup":"sg-6264090b","EmrManagedMasterSecurityGroup":"sg-cb660ba2"}' \
# --service-role EMR_DefaultRole \
# --release-label emr-5.11.1 \
# --name 'rstudio-with-spark' \
# --instance-groups '[{"InstanceCount":1,"EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":25,"VolumeType":"gp2"},"VolumesPerInstance":1}],"EbsOptimized":true},"InstanceGroupType":"MASTER","InstanceType":"m4.large","Name":"Master - 1"}]' \
# --scale-down-behavior TERMINATE_AT_TASK_COMPLETION \
# --region eu-west-2