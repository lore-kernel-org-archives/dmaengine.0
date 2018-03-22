Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/2] drivers: remove force dma flag from buses
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20180322081926.GC29444@lst.de>
Date: Thu, 22 Mar 2018 09:19:26 +0100
To: Nipun Gupta <nipun.gupta@nxp.com>
Cc: robin.murphy@arm.com, hch@lst.de, linux@armlinux.org.uk, gregkh@linuxfoundation.org, m.szyprowski@samsung.com, bhelgaas@google.com, zajec5@gmail.com, andy.gross@linaro.org, david.brown@linaro.org, dan.j.williams@intel.com, vinod.koul@intel.com, thierry.reding@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com, jarkko.sakkinen@linux.intel.com, rafael.j.wysocki@intel.com, dmitry.torokhov@gmail.com, johan@kernel.org, msuchanek@suse.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, bharat.bhushan@nxp.com, leoyang.li@nxp.com
List-ID: <dmaengine.vger.kernel.org>

PiAtLS0gYS9kcml2ZXJzL2RtYS9xY29tL2hpZG1hX21nbXQuYwo+ICsrKyBiL2RyaXZlcnMvZG1h
L3Fjb20vaGlkbWFfbWdtdC5jCj4gQEAgLTM5OCw3ICszOTgsNyBAQCBzdGF0aWMgaW50IF9faW5p
dCBoaWRtYV9tZ210X29mX3BvcHVsYXRlX2NoYW5uZWxzKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAp
Cj4gIAkJfQo+ICAJCW9mX25vZGVfZ2V0KGNoaWxkKTsKPiAgCQluZXdfcGRldi0+ZGV2Lm9mX25v
ZGUgPSBjaGlsZDsKPiAtCQlvZl9kbWFfY29uZmlndXJlKCZuZXdfcGRldi0+ZGV2LCBjaGlsZCk7
Cj4gKwkJb2ZfZG1hX2NvbmZpZ3VyZSgmbmV3X3BkZXYtPmRldiwgY2hpbGQsIHRydWUpOwo+ICAJ
CS8qCj4gIAkJICogSXQgaXMgYXNzdW1lZCB0aGF0IGNhbGxpbmcgb2ZfbXNpX2NvbmZpZ3VyZSBp
cyBzYWZlIG9uCj4gIAkJICogcGxhdGZvcm1zIHdpdGggb3Igd2l0aG91dCBNU0kgc3VwcG9ydC4K
CldoZXJlIGRpZCB3ZSBtYXJrIHRoaXMgYnVzIGFzIGZvcmNlX2RtYSBiZWZvcmU/Cgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jIGIvZHJpdmVycy9vZi9vZl9yZXNl
cnZlZF9tZW0uYwo+IGluZGV4IDlhNGY0MjQ2Li44OTVjODNlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKPiArKysgYi9kcml2ZXJzL29mL29mX3Jlc2VydmVkX21l
bS5jCj4gQEAgLTM1Myw3ICszNTMsNyBAQCBpbnQgb2ZfcmVzZXJ2ZWRfbWVtX2RldmljZV9pbml0
X2J5X2lkeChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAkJLyogZW5zdXJlIHRoYXQgZG1hX29wcyBp
cyBzZXQgZm9yIHZpcnR1YWwgZGV2aWNlcwo+ICAJCSAqIHVzaW5nIHJlc2VydmVkIG1lbW9yeQo+
ICAJCSAqLwo+IC0JCW9mX2RtYV9jb25maWd1cmUoZGV2LCBucCk7Cj4gKwkJb2ZfZG1hX2NvbmZp
Z3VyZShkZXYsIG5wLCB0cnVlKTsKCkRpZCBhbGwgdGhlIGNhbGxlcnMgb2YgdGhpcyBvbmUgcmVh
bGx5IGZvcmNlIGRtYT8gIEkgaGF2ZSBhIGhhcmQgdGltZQp1bnRhbmdsaW5nIHRoZSBjYWxsIHN0
YWNrcyB1bmZvcnR1bmF0ZWx5LgotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNl
bmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGRtYWVuZ2luZSIgaW4KdGhlIGJvZHkgb2YgYSBtZXNz
YWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAg
aHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
