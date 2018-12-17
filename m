Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [5/6] xhci: Use device_iommu_mapped()
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-Id: <3d5b3bb3-b119-7798-4c26-910782ef1bdf@linux.intel.com>
Date: Mon, 17 Dec 2018 13:21:43 +0200
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
Cc: Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, oohall@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, jroedel@suse.de, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, dmaengine@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMTEuMTIuMjAxOCAxNTo0MywgSm9lcmcgUm9lZGVsIHdyb3RlOgo+IEZyb206IEpvZXJnIFJv
ZWRlbCA8anJvZWRlbEBzdXNlLmRlPgo+IAo+IFJlcGxhY2UgdGhlIGRldi0+aW9tbXVfZ3JvdXAg
Y2hlY2sgd2l0aCBhIHByb3BlciBmdW5jdGlvbgo+IGNhbGwgdGhhdCBiZXR0ZXIgcmVwcmVuc2Vu
dHMgaXRzIHB1cnBvc2UuCj4gCj4gQ2M6IE1hdGhpYXMgTnltYW4gPG1hdGhpYXMubnltYW5AaW50
ZWwuY29tPgo+IEFja2VkLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEpvZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgo+IC0tLQo+ICAg
ZHJpdmVycy91c2IvaG9zdC94aGNpLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9z
dC94aGNpLmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuYwo+IGluZGV4IGRhZTNiZTFiOWM4Zi4u
OGVhY2QyZWQ0MTJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jCj4gKysr
IGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmMKPiBAQCAtMjQ0LDcgKzI0NCw3IEBAIHN0YXRpYyB2
b2lkIHhoY2lfemVyb182NGJfcmVncyhzdHJ1Y3QgeGhjaV9oY2QgKnhoY2kpCj4gICAJICogYW4g
aW9tbXUuIERvaW5nIGFueXRoaW5nIHdoZW4gdGhlcmUgaXMgbm8gaW9tbXUgaXMgZGVmaW5pdGVs
eQo+ICAgCSAqIHVuc2FmZS4uLgo+ICAgCSAqLwo+IC0JaWYgKCEoeGhjaS0+cXVpcmtzICYgWEhD
SV9aRVJPXzY0Ql9SRUdTKSB8fCAhZGV2LT5pb21tdV9ncm91cCkKPiArCWlmICghKHhoY2ktPnF1
aXJrcyAmIFhIQ0lfWkVST182NEJfUkVHUykgfHwgIWRldmljZV9pb21tdV9tYXBwZWQoZGV2KSkK
PiAgIAkJcmV0dXJuOwo+ICAgCj4gICAJeGhjaV9pbmZvKHhoY2ksICJaZXJvaW5nIDY0Yml0IGJh
c2UgcmVnaXN0ZXJzLCBleHBlY3RpbmcgZmF1bHRcbiIpOwo+IAoKQWNrZWQtYnk6IE1hdGhpYXMg
TnltYW4gPG1hdGhpYXMubnltYW5AbGludXguaW50ZWwuY29tPgo=
