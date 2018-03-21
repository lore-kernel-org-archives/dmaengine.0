Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/2] dma-mapping: move dma configuration to bus infrastructure
From: Nipun Gupta <nipun.gupta@nxp.com>
Message-Id: <HE1PR0401MB24254A28553F17384BC9F785E6AA0@HE1PR0401MB2425.eurprd04.prod.outlook.com>
Date: Wed, 21 Mar 2018 07:29:38 +0000
To: Bharat Bhushan <bharat.bhushan@nxp.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, "zajec5@gmail.com" <zajec5@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "jarkko.sakkinen@linux.intel.com" <jarkko.sakkinen@linux.intel.com>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "johan@kernel.org" <johan@kernel.org>, "msuchanek@suse.de" <msuchanek@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEJoYXJhdCBCaHVzaGFuCj4gU2Vu
dDogV2VkbmVzZGF5LCBNYXJjaCAyMSwgMjAxOCAxMjo0OQoKPiA+Cj4gPiAraW50IGRtYV9jb25m
aWd1cmUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gK3sKPiA+ICsJaWYgKGRldi0+YnVzLT5kbWFf
Y29uZmlndXJlKQo+ID4gKwkJcmV0dXJuIGRldi0+YnVzLT5kbWFfY29uZmlndXJlKGRldik7Cj4g
Cj4gV2hhdCBpZiBkbWFfY29tbW9uX2NvbmZpZ3VyZSgpIGlzIGNhbGxlZCBpbiBjYXNlICJidXMt
PmRtYV9jb25maWd1cmUiIGlzCj4gbm90IGRlZmluZWQ/Cj4gCj4gVGhhbmtzCj4gLUJoYXJhdAoK
SSB0aGluayBpdCBpcyBjbGVhbmVyIGZvciBidXMgdG8gY2FsbCAnL2RtYV9jb21tb25fY29uZmln
dXJlLycgcmF0aGVyCnRoYW4gdGhpcyBiZWVuIGNhbGxlZCBpbXBsaWNpdGx5LCBidXQgUm9iaW4v
Q2hyaXN0b3BoIGNhbiBjb21tZW50CmJldHRlciBvbiB0aGlzLgoKVGhhbmtzLApOaXB1bgotLS0K
VG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJl
IGRtYWVuZ2luZSIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtl
cm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9t
YWpvcmRvbW8taW5mby5odG1sCg==
