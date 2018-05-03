Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,1/2] dma-mapping: move dma configuration to bus infrastructure
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20180503122147.GB18590@lst.de>
Date: Thu, 3 May 2018 14:21:47 +0200
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Nipun Gupta <nipun.gupta@nxp.com>, robin.murphy@arm.com, hch@lst.de, linux@armlinux.org.uk, gregkh@linuxfoundation.org, m.szyprowski@samsung.com, bhelgaas@google.com, zajec5@gmail.com, andy.gross@linaro.org, david.brown@linaro.org, dan.j.williams@intel.com, vinod.koul@intel.com, robh+dt@kernel.org, frowand.list@gmail.com, jarkko.sakkinen@linux.intel.com, rafael.j.wysocki@intel.com, dmitry.torokhov@gmail.com, johan@kernel.org, msuchanek@suse.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, bharat.bhushan@nxp.com, leoyang.li@nxp.com
List-ID: <dmaengine.vger.kernel.org>

T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMTI6NDE6MjRQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gT24gU2F0LCBBcHIgMjgsIDIwMTggYXQgMDg6MjE6NThBTSArMDUzMCwgTmlwdW4g
R3VwdGEgd3JvdGU6Cj4gWy4uLl0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ob3N0MXgv
YnVzLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvYnVzLmMKPiA+IGluZGV4IDg4YTM1NTguLmE5ZWM5
OWQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvYnVzLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2hvc3QxeC9idXMuYwo+ID4gQEAgLTMxNCw2ICszMTQsMTMgQEAgc3RhdGljIGlu
dCBob3N0MXhfZGV2aWNlX21hdGNoKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9k
cml2ZXIgKmRydikKPiA+ICAJcmV0dXJuIHN0cmNtcChkZXZfbmFtZShkZXYpLCBkcnYtPm5hbWUp
ID09IDA7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBpbnQgaG9zdDF4X2RtYV9jb25maWd1cmUo
c3RydWN0IGRldmljZSAqZGV2KQo+ID4gK3sKPiA+ICsJaWYgKGRldi0+b2Zfbm9kZSkKPiA+ICsJ
CXJldHVybiBvZl9kbWFfY29uZmlndXJlKGRldiwgZGV2LT5vZl9ub2RlKTsKPiAKPiBUaGUgY29u
ZGl0aW9uYWwgaGVyZSBpcyBzb21ld2hhdCBwb2ludGxlc3Mgc2luY2UgdGhlIG9mX25vZGUgc2hv
dWxkCj4gYWx3YXlzIGJlIHNldC4gSWYgaXQgd2VyZW4ndCBpdCBzaG91bGQgYmUgY29uc2lkZXJl
ZCBhIGJ1ZyBhbmQgdGhpcwo+IGZ1bmN0aW9uIHdlbGNvbWUgdG8gY3Jhc2ggdG8gbWFrZSB0aGF0
IHZlcnkgb2J2aW91cy4KCkFncmVlZC4gIFBsZWFzZSByZW1vdmUgdGhlIGNoZWNrIGZvciB0aGUg
cmVzZW5kLgotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUg
InVuc3Vic2NyaWJlIGRtYWVuZ2luZSIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9y
ZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIu
a2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
