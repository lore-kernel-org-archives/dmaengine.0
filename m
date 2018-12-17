Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/6] ACPI/IORT: Use device_iommu_mapped()
From: Hanjun Guo <guohanjun@huawei.com>
Message-Id: <2c279b05-f845-94ac-f0ad-a0c54f48a7ca@huawei.com>
Date: Mon, 17 Dec 2018 17:21:13 +0800
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
Cc: Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, oohall@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, jroedel@suse.de, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, dmaengine@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMjAxOC8xMi8xMSAyMTo0MywgSm9lcmcgUm9lZGVsIHdyb3RlOgo+IEZyb206IEpvZXJnIFJv
ZWRlbCA8anJvZWRlbEBzdXNlLmRlPgo+IAo+IFJlcGxhY2UgdGhlIGlvbW11LWNoZWNrIHdpdGgg
YSBwcm9wZXIgYW5kIHJlYWRhYmxlIGZ1bmN0aW9uCj4gY2FsbC4KPiAKPiBDYzogTG9yZW56byBQ
aWVyYWxpc2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+Cj4gQWNrZWQtYnk6IFJvYmluIE11
cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9lcmcgUm9lZGVs
IDxqcm9lZGVsQHN1c2UuZGU+CgpBY2tlZC1ieTogSGFuanVuIEd1byA8aGFuanVuLmd1b0BsaW5h
cm8ub3JnPgoKVGhhbmtzCkhhbmp1bgo=
