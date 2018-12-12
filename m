Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/6] driver core: Introduce device_iommu_mapped() function
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20181212110435.GC1990@kroah.com>
Date: Wed, 12 Dec 2018 12:04:35 +0100
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org, Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, oohall@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, jroedel@suse.de, Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, dmaengine@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMDI6NDM6MzhQTSArMDEwMCwgSm9lcmcgUm9lZGVsIHdy
b3RlOgo+IEZyb206IEpvZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgo+IAo+IFNvbWUgcGxh
Y2VzIGluIHRoZSBrZXJuZWwgY2hlY2sgdGhlIGlvbW11X2dyb3VwIHBvaW50ZXIgaW4KPiAnc3Ry
dWN0IGRldmljZScgaW4gb3JkZXIgdG8gZmluZCBvdCB3aGV0aGVyIGEgZGV2aWNlIGlzCj4gbWFw
cGVkIGJ5IGFuIElPTU1VLgo+IAo+IFRoaXMgaXMgbm90IGdvb2Qgd2F5IHRvIG1ha2UgdGhpcyBj
aGVjaywgYXMgdGhlIHBvaW50ZXIgd2lsbAo+IGJlIG1vdmVkIHRvICdzdHJ1Y3QgZGV2X2lvbW11
X2RhdGEnLiBUaGlzIHdheSB0byBtYWtlIHRoZQo+IGNoZWNrIGlzIGFsc28gbm90IHZlcnkgcmVh
ZGFibGUuCj4gCj4gSW50cm9kdWNlIGFuIGV4cGxpY2l0IGZ1bmN0aW9uIHRvIHBlcmZvcm0gdGhp
cyBjaGVjay4KPiAKPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KPiBBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KCk5vIG5lZWQgdG8gaGF2ZSBhIGNjOiBsaW5lIGlmIEkgaGF2ZSBhbHJlYWR5
IGFja2VkIGl0IDopCgp0aGFua3MsCgpncmVnIGstaAo=
