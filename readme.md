# Create Test Certificate Script
 
### Requires Windows SDK 

Creates a certificate along with a private key for testing code signing

Will generate a .CER file (the public certificate that you can install on
any machine)

And a .PFX file (the private key and certificate in a PKCS#12 file

Usage:
maketestcert subject name

The utility will ask for a password when creating a .PFX file.


# How to create the package for this CMD script

To create the package for this CMD script, you can simply call autopackage:

```
autopackage MakeTestCert.autopkg
```

If it is the first time you are using autopackage, you can pass the certificate
and password to the it, and ask it to remember for next time:

```
autopackage --certificate-path=cert.pfx --password=pass --remember MakeTestCert.autopkg
```
