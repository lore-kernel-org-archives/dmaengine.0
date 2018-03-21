Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/2] dma-mapping: move dma configuration to bus infrastructure
From: Nipun Gupta <nipun.gupta@nxp.com>
Message-Id: <HE1PR0401MB242585F3CB211F71AF29791EE6AA0@HE1PR0401MB2425.eurprd04.prod.outlook.com>
Date: Wed, 21 Mar 2018 16:13:38 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "zajec5@gmail.com" <zajec5@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "msuchanek@suse.de" <msuchanek@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bharat Bhushan <bharat.bhushan@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEdyZWcgS0ggW21haWx0bzpncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZ10KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDIxLCAyMDE4
IDE1OjAwCgo8c25pcD4KCj4gPiAraW50IGRtYV9jb25maWd1cmUoc3RydWN0IGRldmljZSAqZGV2
KQo+ID4gK3sKPiA+ICsJaWYgKGRldi0+YnVzLT5kbWFfY29uZmlndXJlKQo+ID4gKwkJcmV0dXJu
IGRldi0+YnVzLT5kbWFfY29uZmlndXJlKGRldik7Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4g
K30KPiA+ICB2b2lkIGRtYV9kZWNvbmZpZ3VyZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gCj4gRW1w
dHkgbGluZSBhZnRlciB0aGlzIG5ldyBmdW5jdGlvbj8gIFNvcnJ5LCBjb3VsZG4ndCBoZWxwIGl0
IDopCj4gCj4gPiAgewo+ID4gIAlvZl9kbWFfZGVjb25maWd1cmUoZGV2KTsKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYyBiL2RyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jCj4g
PiBpbmRleCBmMWJmN2IzLi5kMmQ1ODkxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9iYXNlL3Bs
YXRmb3JtLmMKPiA+ICsrKyBiL2RyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jCj4gPiBAQCAtMTEzMCw2
ICsxMTMwLDExIEBAIGludCBwbGF0Zm9ybV9wbV9yZXN0b3JlKHN0cnVjdCBkZXZpY2UgKmRldikK
PiA+Cj4gPiAgI2VuZGlmIC8qIENPTkZJR19ISUJFUk5BVEVfQ0FMTEJBQ0tTICovCj4gPgoKPHNu
aXA+Cgo+ID4gKwo+ID4gIAljb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqcG07Cj4gPgo+ID4gIAlj
b25zdCBzdHJ1Y3QgaW9tbXVfb3BzICppb21tdV9vcHM7Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9kbWEtbWFwcGluZy5oIGIvaW5jbHVkZS9saW51eC9kbWEtbWFwcGluZy5oCj4gPiBp
bmRleCBlYjllYWI0Li5jMTU5ODZiIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEt
bWFwcGluZy5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1tYXBwaW5nLmgKPiA+IEBAIC03
NjEsNiArNzYxLDcgQEAgdm9pZCAqZG1hX21hcmtfZGVjbGFyZWRfbWVtb3J5X29jY3VwaWVkKHN0
cnVjdAo+IGRldmljZSAqZGV2LAo+ID4gIH0KPiA+ICAjZW5kaWYgLyogQ09ORklHX0hBVkVfR0VO
RVJJQ19ETUFfQ09IRVJFTlQgKi8KPiA+Cj4gPiAraW50IGRtYV9jb21tb25fY29uZmlndXJlKHN0
cnVjdCBkZXZpY2UgKmRldik7Cj4gPiAgI2lmZGVmIENPTkZJR19IQVNfRE1BCj4gCj4gQmxhbmsg
bGluZSBhZnRlciB0aGUgbmV3IGZ1bmN0aW9uIGRlY2xhcmF0aW9uPwo+IAo+IE90aGVyIHRoYW4g
dGhvc2UgdmVyeSBtaW5vciB0aGluZ3MsIG5pY2Ugam9iLCB0aGlzIGxvb2tzIGdvb2Q6Cj4gCj4g
UmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcgOikuIEkgd2lsbCBmaXggeW91ciBjb21tZW50
cyBpbiBuZXh0IHZlcnNpb24uCgpSZWdhcmRzLApOaXB1bgotLS0KVG8gdW5zdWJzY3JpYmUgZnJv
bSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRtYWVuZ2luZSIgaW4KdGhl
IGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpv
cmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1s
Cg==
