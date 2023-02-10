#EC2 Instance Public IP
output "instance_publicip" {
    description = "EC2 instance Public IP"
    #value = aws_instance.myec2vm.public_ip #Same area for Public IP is the location find this and this is value for Just instance thats is without count being used 
    value = aws_instance.myec2vm.*.public_ip #This is for count
}

#EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  #value = aws_instance.myec2vm.public_dns #Same area for Public IP is the location find this and this is value for Just instance thats is without count being used 
  value = aws_instance.myec2vm.*.public_dns 

}

output "instance_state" {
    description = "To get the state of instance created" 
    #value = aws_instance.myec2vm.instance_state #this is value for Just instance thats is without count being used 
    value = aws_instance.myec2vm.*.instance_state #This is for count argument
  
}

#BELOW ARE COUNT CONCEPTS 

#OutPut - For Loop with List and this outputs the PUBLIC_DNS OF INSTANCES TOO
output "for_output_list" {
  description = "For Lopp with List"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}

#Output - for Loop with Map and this outputs the PUBLIC_DNS OF INSTANCES TOO
output "for_output_map1" {
  description = "For Loop with Map"
  value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
}

#Output - For loop with Map Advanced
output "for_output_map2" {
  description = "For Loop with Ma - Advanced"
  value = {for c, instance in aws_instance.myec2vm: c => instance.public_ip}
}

#Output Legacy Splat Operator (Legacy) - Returns the List and this getting depicated soon
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.myec2vm.*.public_dns
}

#OutPut Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized legacy Splat Operator"
  value = aws_instance.myec2vm[*].public_dns
}