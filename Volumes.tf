resource "aws_ebs_volume" "ansible-instance" {
     availability_zone = "${var.region}a"
     size             = 100
}

resource "aws_volume_attachment" "ebs_att" {
     device_name = "/dev/sdh"
     volume_id   = aws_ebs_volume.ansible-instance.id
     instance_id = aws_instance.ansible-instance.id
}