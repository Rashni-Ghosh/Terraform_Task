resource "aws_ebs_volume" "teststorage" {
	availability_zone = aws_instance.linux-os.availability_zone
	size		  = 1
	tags = {
		Name      = "mystorage" 
	}
}

resource "aws_volume_attachment" "new_attached_vol" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.teststorage.id
  instance_id = aws_instance.linux-os.id
}