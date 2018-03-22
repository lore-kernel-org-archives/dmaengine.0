Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/2] drivers: remove force dma flag from buses
From: Nipun Gupta <nipun.gupta@nxp.com>
Message-Id: <HE1PR0401MB2425407DADB19FCF6E016456E6A90@HE1PR0401MB2425.eurprd04.prod.outlook.com>
Date: Thu, 22 Mar 2018 15:13:49 +0000
To: Christoph Hellwig <hch@lst.de>
Cc: "robin.murphy@arm.com" <robin.murphy@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "zajec5@gmail.com" <zajec5@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "msuchanek@suse.de" <msuchanek@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bharat Bhushan <bharat.bhushan@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IENocmlzdG9waCBIZWxsd2lnIFtt
YWlsdG86aGNoQGxzdC5kZV0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjIsIDIwMTggMTM6NDkK
PiBUbzogTmlwdW4gR3VwdGEgPG5pcHVuLmd1cHRhQG54cC5jb20+Cj4gCj4gPiAtLS0gYS9kcml2
ZXJzL2RtYS9xY29tL2hpZG1hX21nbXQuYwo+ID4gKysrIGIvZHJpdmVycy9kbWEvcWNvbS9oaWRt
YV9tZ210LmMKPiA+IEBAIC0zOTgsNyArMzk4LDcgQEAgc3RhdGljIGludCBfX2luaXQKPiBoaWRt
YV9tZ210X29mX3BvcHVsYXRlX2NoYW5uZWxzKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gPiAg
CQl9Cj4gPiAgCQlvZl9ub2RlX2dldChjaGlsZCk7Cj4gPiAgCQluZXdfcGRldi0+ZGV2Lm9mX25v
ZGUgPSBjaGlsZDsKPiA+IC0JCW9mX2RtYV9jb25maWd1cmUoJm5ld19wZGV2LT5kZXYsIGNoaWxk
KTsKPiA+ICsJCW9mX2RtYV9jb25maWd1cmUoJm5ld19wZGV2LT5kZXYsIGNoaWxkLCB0cnVlKTsK
PiA+ICAJCS8qCj4gPiAgCQkgKiBJdCBpcyBhc3N1bWVkIHRoYXQgY2FsbGluZyBvZl9tc2lfY29u
ZmlndXJlIGlzIHNhZmUgb24KPiA+ICAJCSAqIHBsYXRmb3JtcyB3aXRoIG9yIHdpdGhvdXQgTVNJ
IHN1cHBvcnQuCj4gCj4gV2hlcmUgZGlkIHdlIG1hcmsgdGhpcyBidXMgYXMgZm9yY2VfZG1hIGJl
Zm9yZT8KCkkgdGhvdWdodCB0aGVzZSBkZXZpY2VzIHRvIGJlIG9uIHRoZSBwbGF0Zm9ybSBidXMg
YXMgdGhlIGRldmljZSBpcyBvZiB0eXBlCidzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlJywgdGhvdWdo
IEkgYW0gbm90IHN1cmUgdGhlbiB3aHkgJ29mX2RtYV9jb25maWd1cmUoKScKaXMgY2FsbGVkIGhl
cmUuIElzIHRoaXMgbm90IG9uIHBsYXRmb3JtIGJ1cz8KCj4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYyBiL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMK
PiA+IGluZGV4IDlhNGY0MjQ2Li44OTVjODNlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9vZi9v
Zl9yZXNlcnZlZF9tZW0uYwo+ID4gKysrIGIvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYwo+
ID4gQEAgLTM1Myw3ICszNTMsNyBAQCBpbnQgb2ZfcmVzZXJ2ZWRfbWVtX2RldmljZV9pbml0X2J5
X2lkeChzdHJ1Y3QgZGV2aWNlCj4gKmRldiwKPiA+ICAJCS8qIGVuc3VyZSB0aGF0IGRtYV9vcHMg
aXMgc2V0IGZvciB2aXJ0dWFsIGRldmljZXMKPiA+ICAJCSAqIHVzaW5nIHJlc2VydmVkIG1lbW9y
eQo+ID4gIAkJICovCj4gPiAtCQlvZl9kbWFfY29uZmlndXJlKGRldiwgbnApOwo+ID4gKwkJb2Zf
ZG1hX2NvbmZpZ3VyZShkZXYsIG5wLCB0cnVlKTsKPiAKPiBEaWQgYWxsIHRoZSBjYWxsZXJzIG9m
IHRoaXMgb25lIHJlYWxseSBmb3JjZSBkbWE/ICBJIGhhdmUgYSBoYXJkIHRpbWUKPiB1bnRhbmds
aW5nIHRoZSBjYWxsIHN0YWNrcyB1bmZvcnR1bmF0ZWx5LgoKSSBzZWUgdGhpcyBBUEkgYmVpbmcg
Y2FsbGVkIGluZGlyZWN0bHkgZnJvbSBOWFAgRFBBQSBkZXZpY2UgZHJpdmVyIHdoaWNoCmlzIGZv
ciBwbGF0Zm9ybSBidXMgZGV2aWNlcy4gU28gSSBtYXJrZWQgJ3RydWUnIG91dCBoZXJlLiBUaGVy
ZSBhcmUgbW9yZSBwbGFjZXMKZnJvbSB3aGVyZSBpdCBpcyBiZWluZyBjYWxsZWQuCgpUaGFua3Ms
Ck5pcHVuCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAi
dW5zdWJzY3JpYmUgZG1hZW5naW5lIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jk
b21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5r
ZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
