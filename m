Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/6] driver core: Introduce device_iommu_mapped() function
From: Joerg Roedel <jroedel@suse.de>
Message-Id: <20181212110757.dzktysa5gbs5fkwe@suse.de>
Date: Wed, 12 Dec 2018 12:07:57 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, oohall@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, dmaengine@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gV2VkLCBEZWMgMTIsIDIwMTggYXQgMTI6MDQ6MzVQTSArMDEwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDExLCAyMDE4IGF0IDAyOjQzOjM4UE0gKzAxMDAsIEpv
ZXJnIFJvZWRlbCB3cm90ZToKPiA+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPgo+ID4gQWNrZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gCj4gTm8gbmVlZCB0byBoYXZlIGEgY2M6IGxpbmUgaWYg
SSBoYXZlIGFscmVhZHkgYWNrZWQgaXQgOikKClJpZ2h0LCBJJ2xsIHJlbW92ZSBpdCwgc29ycnkg
Zm9yIHRoZSBub2lzZS4KClJlZ2FyZHMsCgoJSm9lcmcK
