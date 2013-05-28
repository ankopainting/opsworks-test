
This is just a test of some chef recipes for AWS opsworks

nfsserver should be applied on one server, then its ip should be put in some json eg.
{
	"content_repository_ip": "10.1.1.1"
}

and then apply nfs and web to your web servers (already running php and apache)